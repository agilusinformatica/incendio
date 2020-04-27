using Newtonsoft.Json;
using System;
using System.IO;
using System.Net;
using System.Text;
using System.Xml.Serialization;

namespace PonteProcob.Models
{

    public class Consulta
    {
        private string cpf;
        private string usuario;
        private string senha;
        

        public Consulta(string cpf, string usuario, string senha)
        {
            this.cpf = cpf;
            this.usuario = usuario;
            this.senha = senha;
        }

        /*public string Dados()
        {
            string[] RetornoConsulta;
            string textoRetorno;
            RetornoConsulta retorno = new RetornoConsulta();
            
            //Get 
            StringBuilder urlConsulta = new StringBuilder("https://consulta.procob.com/webservice/consultanova.php?");
            urlConsulta.Append("&usuario="+ this.usuario);
            urlConsulta.Append("&senha=" + this.senha);
            urlConsulta.Append("&tipocons=2057"); //Soma dos códigos referentes aos dados que quero retornar na consulta
            urlConsulta.Append("&cpfcnpj=" + this.cpf);

            WebRequest dadosRequisicao = WebRequest.Create(urlConsulta.ToString());
            StreamReader sleitura = new StreamReader(dadosRequisicao.GetResponse().GetResponseStream());
            textoRetorno = sleitura.ReadToEnd();
            RetornoConsulta = textoRetorno.Split();

            return textoRetorno;
        }*/

        public RetornoConsulta Dados()
        {
            String urlConsulta = "https://api.procob.com/consultas/v1/L0001/" + this.cpf;
            WebRequest dadosRequisicao = WebRequest.Create(urlConsulta);
            String encoded = System.Convert.ToBase64String(System.Text.Encoding.GetEncoding("ISO-8859-1").GetBytes(this.usuario + ":" + this.senha));
            dadosRequisicao.Headers.Add("Authorization", "Basic " + encoded);
            StreamReader sleitura = new StreamReader(dadosRequisicao.GetResponse().GetResponseStream());
            string textoRetorno = sleitura.ReadToEnd();
            dynamic retornoJson = JsonConvert.DeserializeObject(textoRetorno);

            RetornoConsulta retorno = new RetornoConsulta();

            if (retornoJson.code != "000") // deu erro
            {
                retorno.Erro = retornoJson.message;
                return retorno;
            }

            retorno.resultadoJson = textoRetorno;

            if (retornoJson.content.nome.existe_informacao == "SIM")
            {
                string dataNascimento = retornoJson.content.nome.conteudo[0].data_nascimento;
                dataNascimento = dataNascimento.Substring(6, 4) + "-" + dataNascimento.Substring(3, 2) + "-" + dataNascimento.Substring(0, 2);
                retorno.DadosCadastrais.DataNascimento = dataNascimento;
                retorno.DadosCadastrais.Cpf = retornoJson.content.nome.conteudo[0].documento;
                retorno.DadosCadastrais.Nome = retornoJson.content.nome.conteudo[0].nome;
            }


            if (retornoJson.content.pesquisa_telefones.existe_informacao == "SIM")
            {
                if (retornoJson.content.pesquisa_telefones.conteudo.outros != null)
                    foreach (dynamic fone in retornoJson.content.pesquisa_telefones.conteudo.outros)
                    {
                        retorno.Telefones.Add(new Telefone
                        {
                            Ddd = fone.ddd,
                            Fone = fone.telefone,
                            Tipo = "outros"
                        });
                    }
                if (retornoJson.content.pesquisa_telefones.conteudo.celular != null)
                    foreach (dynamic fone in retornoJson.content.pesquisa_telefones.conteudo.celular)
                    {
                        retorno.Telefones.Add(new Telefone
                        {
                            Ddd = fone.ddd,
                            Fone = fone.telefone,
                            Tipo = "celular"
                        });
                    }
                if (retornoJson.content.pesquisa_telefones.conteudo.comercial != null)
                    foreach (dynamic fone in retornoJson.content.pesquisa_telefones.conteudo.comercial)
                    {
                        retorno.Telefones.Add(new Telefone
                        {
                            Ddd = fone.ddd,
                            Fone = fone.telefone,
                            Tipo = "comercial"
                        });
                    }
            }

            return retorno;
        }

        /*public string Dados3()
        {
            String urlConsulta = "https://api.procob.com/consultas/v1/L0001/"+this.cpf;
            WebRequest dadosRequisicao = WebRequest.Create(urlConsulta);
            String encoded = System.Convert.ToBase64String(System.Text.Encoding.GetEncoding("ISO-8859-1").GetBytes(this.usuario + ":" + this.senha));
            dadosRequisicao.Headers.Add("Authorization", "Basic " + encoded);
            StreamReader sleitura = new StreamReader(dadosRequisicao.GetResponse().GetResponseStream());
            string textoRetorno = sleitura.ReadToEnd();
            return textoRetorno;
        }*/

        public string ToXML<T>(T obj)
        {
            using (StringWriter stringWriter = new StringWriter(new StringBuilder()))
            {
                XmlSerializer xmlSerializer = new XmlSerializer(typeof(T));
                xmlSerializer.Serialize(stringWriter, obj);
                return stringWriter.ToString();
            }
        }
    }
}