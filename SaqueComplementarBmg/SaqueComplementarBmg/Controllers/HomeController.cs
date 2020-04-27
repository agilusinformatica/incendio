using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Web;
using System.Web.Mvc;
using System.Xml;
using System.Xml.Serialization;

namespace SaqueComplementarBmg.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index(string login, string senha, string cpf, string matricula, int codEntidade, int? sequencialOrgao)
        {
            /*
             http://localhost:4851/?login=VALORRONALDO&senha=ed9ada7%23&codEntidade=3764&cpf=52309584134&matricula=000455650400&sequencialOrgao=51
             http://localhost:4851/?login=VALORRONALDO&senha=ed9ada7%23&codEntidade=128&cpf=01206070854&matricula=5678790&sequencialOrgao=13
             */

            ServicePointManager.SecurityProtocol = (SecurityProtocolType)3072;
            var bmg = new bmgConsigReference.SaqueComplementarWebServiceService();
            var paramCartaoDisponivel = new bmgConsigReference.CartaoDisponivelParameter();
            var retornoCartaoDisponivel = new bmgConsigReference.CartaoDisponivelRetorno();
            var paramLimiteSaque = new bmgConsigReference.DadosCartaoParameter();
            var retornoLimiteSaque = new bmgConsigReference.LimiteSaqueRetorno();
            var Result = new ResultadoConsultaLimite();

            paramCartaoDisponivel.login = login;
            paramCartaoDisponivel.senha = senha;
            paramCartaoDisponivel.codigoEntidade = codEntidade;
            if (sequencialOrgao == null) sequencialOrgao = 0;
            paramCartaoDisponivel.sequencialOrgao = sequencialOrgao;
            paramCartaoDisponivel.cpf = cpf;
            paramCartaoDisponivel.senhaConsig = "";
            paramCartaoDisponivel.loginConsig = "";

            try
            {
                retornoCartaoDisponivel = bmg.buscarCartoesDisponiveis(paramCartaoDisponivel);
            }
            catch (Exception ex)
            {
                Result = new ResultadoConsultaLimite();
                Result.Erro = ex.Message;
                return this.Content(Serialize(Result), "text/xml");
            }

            string msgErro = "";
            bool achei = false;

            List<bmgConsigReference.CartaoRetorno> cartoesRetorno;

            // quando não vem a matricula como parâmetro
            if (String.IsNullOrWhiteSpace(matricula) && retornoCartaoDisponivel.cartoesRetorno.Length > 0)
            {
                cartoesRetorno = new List<bmgConsigReference.CartaoRetorno>();
                cartoesRetorno.Add(retornoCartaoDisponivel.cartoesRetorno.ToList()[0]);
                matricula = retornoCartaoDisponivel.cartoesRetorno[0].matricula;
            }
            else
            {
                cartoesRetorno = retornoCartaoDisponivel.cartoesRetorno.ToList();
            }

            foreach (var cartao in cartoesRetorno)
            {
                Result.Matricula = cartao.matricula;
                if (Convert.ToInt64(cartao.matricula) == Convert.ToInt64(matricula))
                {
                    if (!cartao.liberado)
                    {
                        Result = new ResultadoConsultaLimite();
                        Result.Erro = cartao.mensagemImpedimento;
                        return this.Content(Serialize(Result), "text/xml");
                    }

                    paramLimiteSaque.login = login;
                    paramLimiteSaque.senha = senha;
                    paramLimiteSaque.codigoEntidade = codEntidade;
                    paramLimiteSaque.sequencialOrgao = sequencialOrgao == 0 ? null : sequencialOrgao;
                    paramLimiteSaque.cpf = cpf;
                    paramLimiteSaque.matricula = cartao.matricula;
                    paramLimiteSaque.numeroContaInterna = cartao.numeroContaInterna;
                    paramLimiteSaque.tipoSaque = 1;
                    paramLimiteSaque.codigoTipoSeguro = 1;
                    paramLimiteSaque.senhaConsig = "";

                    retornoLimiteSaque = bmg.buscarLimiteSaque(paramLimiteSaque);
                    msgErro = retornoLimiteSaque.mensagemDeErro;
                    if (String.IsNullOrWhiteSpace(msgErro))
                    {
                        achei = true;
                        Result.NumeroAdesao = cartao.numeroAdesao;
                        Result.NumeroCartao = cartao.numeroCartao;
                        Result.ValorSaqueMinimo = retornoLimiteSaque.valorSaqueMinimo;
                        Result.ValorSaqueMaximo = retornoLimiteSaque.valorSaqueMaximo;
                        Result.Margem = retornoLimiteSaque.valorMargem;
                        Result.SeguroElegivel = retornoLimiteSaque.resultadoConsultaElegibilidadeDeSeguro.elegivel;
                        if (Result.SeguroElegivel)
                        {
                            Result.DescricaoSeguro = retornoLimiteSaque.resultadoConsultaElegibilidadeDeSeguro.seguro.descricaoSeguro;
                            Result.ValorSeguro = retornoLimiteSaque.resultadoConsultaElegibilidadeDeSeguro.seguro.valorDoSeguro;
                        }
                        else
                            Result.MotivoNaoElegibilidade = retornoLimiteSaque.resultadoConsultaElegibilidadeDeSeguro.motivoDeNaoEligibilidade;
                    }
                }
            }
            if ((!achei) && (!String.IsNullOrWhiteSpace(msgErro)))
            {
                Result = new ResultadoConsultaLimite();
                Result.Erro = msgErro;
                return this.Content(Serialize(Result), "text/xml");
            }
            //return Result;
            return this.Content(Serialize(Result), "text/xml");
        }
        private string StreamToString(Stream stream)
        {
            //stream.Position = 0;
            using (StreamReader reader = new StreamReader(stream, Encoding.UTF8))
            {
                return reader.ReadToEnd();
            }
        }

        private string Serialize<T>(T value)
        {
            if (value == null)
            {
                return string.Empty;
            }
            try
            {
                var xmlserializer = new XmlSerializer(typeof(T));
                var stringWriter = new StringWriter();
                using (var writer = XmlWriter.Create(stringWriter))
                {
                    xmlserializer.Serialize(writer, value);
                    return stringWriter.ToString();
                }
            }
            catch (Exception ex)
            {
                throw new Exception("An error occurred", ex);
            }
        }

        private Stream StringToStream(string src)
        {
            byte[] byteArray = Encoding.UTF8.GetBytes(src);
            return new MemoryStream(byteArray);
        }
    }

    public class ResultadoConsultaLimite
    {
        public string Erro;
        public string NumeroAdesao;
        public string NumeroCartao;
        public double ValorSaqueMinimo;
        public double ValorSaqueMaximo;
        public double Margem;
        public bool SeguroElegivel;
        public string MotivoNaoElegibilidade;
        public string DescricaoSeguro;
        public double ValorSeguro;
        public string Matricula;
    }
}
