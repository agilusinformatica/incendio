using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Services.Protocols;
using System.Xml;

namespace WebServiceHeaderExtension
{
    public class WebServcSoapExt : SoapExtension
    {
        private Stream inwardStream;
        private Stream outwardStream;

        public override Stream ChainStream(Stream stream)
        {
            outwardStream = stream;
            inwardStream = new MemoryStream();
            return inwardStream;
        }

        public override object GetInitializer(Type serviceType)
        {
            return null;
        }
        public override object GetInitializer(LogicalMethodInfo
        methodInfo, SoapExtensionAttribute attribute)
        {
            return null;
        }
        public override void Initialize(object initializer)
        {
            return;
        }
        public override void ProcessMessage(System.Web.Services.Protocols.SoapMessage message)
        {
            var resultado = StreamToString(message.Stream);
        }

        private string StreamToString(Stream stream)
        {
            //stream.Position = 0;
            using (StreamReader reader = new StreamReader(stream, Encoding.UTF8))
            {
                return reader.ReadToEnd();
            }
        }

    }
}
