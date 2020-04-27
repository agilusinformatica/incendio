using System;
using System.Collections.Generic;
using System.Text;

namespace PonteProcob.Models
{
    public class RetornoConsulta
    {

        public List<Telefone> Telefones;
        public DadosCadastrais DadosCadastrais { get; set; }
        public string Erro { get; set; }
        public string resultadoJson { get; set; }

        public RetornoConsulta()
        {
            DadosCadastrais = new DadosCadastrais();
            Telefones = new List<Telefone>();
        }
    }

    public class Telefone
    {
        public int Ddd { get; set; }
        public int Fone { get; set; }
        public string Tipo { get; set; }
    }

    public class DadosCadastrais
    {
        public string DataNascimento { get; set; }
        public string Cpf { get; set; }
        public string Nome { get; set; }
    }
}


/*
<RetornoConsulta xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema">
  <DadosCadastrais>
    <DataNascimento>1964-10-01</DataNascimento>
    <Cpf>00006025387850</Cpf>
    <Nome>RICARDO ALVES CARVALHO</Nome>
  </DadosCadastrais>
  <Telefones>
    <Telefone>
      <Ddd>31</Ddd>
      <Fone>32178512</Fone>
    </Telefone>
  </Telefones>
</RetornoConsulta>
*/