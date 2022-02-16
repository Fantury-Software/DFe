* ---------------------------------------------------------------------------------
* Consumindo o servi�o de consulta a situacao da NFe
* ---------------------------------------------------------------------------------
Function ConsultaSituacaoNfe()
   Local InicializarConfiguracao
   Local consSitNfe
   Local consultaProtocolo

 * Criar configura�ao b�sica para consumir o servi�o
   InicializarConfiguracao = CreateObject("Unimake.Business.DFe.Servicos.Configuracao")
   InicializarConfiguracao:TipoDfe = 0 // 0=nfe
   InicializarConfiguracao:Servico = 1 // 1=Situacao da NFE
   InicializarConfiguracao:CertificadoSenha = "12345678"
   InicializarConfiguracao:CertificadoArquivo = "C:\Projetos\certificados\UnimakePV.pfx"

 * Criar XML
   consSitNfe = CreateObject("Unimake.Business.DFe.Xml.NFe.ConsSitNfe")
   consSitNfe:Versao = "4.00"
   consSitNfe:TpAmb  = 2  // Homologa��o
   consSitNfe:ChNfe  = "41200106117473000150550010000606641403753210" // Chave da NFE 
   
 * Consumir o servi�o
   consultaProtocolo = CreateObject("Unimake.Business.DFe.Servicos.NFe.ConsultaProtocolo")
   consultaProtocolo:Executar(consSitNfe,InicializarConfiguracao)

   ? "XML Retornado pela SEFAZ"
   ? "========================"
   ? consultaProtocolo:RetornoWSString
   ?
   ? "Codigo de Status e Motivo"
   ? "========================="
   ? AllTrim(Str(consultaProtocolo:Result:CStat,5)),consultaProtocolo:Result:XMotivo
   ?
   Wait
Return

