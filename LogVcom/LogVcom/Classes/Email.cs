using Microsoft.Office.Interop.Outlook;

namespace LogVcom.Classes
{
    public static class Email
    {
        public static void Gravar(Items emailsNaoLidos)
        {
            for (int i = emailsNaoLidos.Count; i > 0; i--)
            {
                if (emailsNaoLidos[i].Subject.Contains("Erro LogVcom"))
                {
                    var comando = comandoemail(emailsNaoLidos[i].Body);
                    var servidor = servidorCliente(emailsNaoLidos[i].Body);
                    var db = bancoDados(emailsNaoLidos[i].Body);

                    BancoDados.Inserir(db, servidor, comando);
                    emailsNaoLidos[i].UnRead = false;
                }
            }
        }
        private static string comandoemail(string corpoEmail)
        {
            var p1 = corpoEmail.IndexOf("Comando: ");
            var p2 = corpoEmail.IndexOf("')", p1);
            return corpoEmail.Substring(p1 + 9, (p2 - (p1 + 7)));
        }
        private static string servidorCliente(string corpoEmail)
        {
            var p1 = corpoEmail.IndexOf("Endereço: ");
            var p2 = corpoEmail.IndexOf("Comando: ", p1);
            return corpoEmail.Substring(p1 + 10, p2 - (p1 + 14));
        }
        private static string bancoDados(string corpoEmail)
        {
            var p1 = corpoEmail.IndexOf("db: ");
            var p2 = corpoEmail.IndexOf("Endereço: ", p1);
            return corpoEmail.Substring(p1 + 4, p2 - (p1 + 8));
        }
    }
}
