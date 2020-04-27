using System;
using System.Data;
using System.Data.SqlClient;

namespace LogVcom.Classes
{
    static class BancoDados
    {
        static SqlConnection conexao = new SqlConnection();
        private static void Conectar(string bancoDados, string servidor)
        {
            conexao.ConnectionString = "Data Source = " + servidor + "; Initial Catalog = " + bancoDados + "; Integrated Security = False; User ID = claudio; Password= op@58523";
            conexao.Open();
        }
        private static void Desconectar()
        {
            conexao.Close();
        }
        public static int Inserir(string bancoDados, string servidor, string stringcomando)
        {
            Conectar(bancoDados, servidor);
            using (var comando = new SqlCommand())
            {
                comando.CommandText = stringcomando;
                comando.Connection = conexao;
                try
                {
                    return Convert.ToInt32(comando.ExecuteScalar());
                }
                finally
                {
                    Desconectar();
                }
            }
        }
    }
}
