## Brainstorming:

### Nome:
Bemol Canal
Nome simples e direto ao ponto;
Segue o padrão dos outros nomes: Bemol Digital, Bemol Solar, Bemol Farma.

### Frontend:
Optei por usar o Framework Flutter para um app mobile, pois:
* É a tecnologia que possuo maior domínio atualmente;
* Celulares é o dispositivo de acesso mais comum no brasil: https://veja.abril.com.br/blog/matheus-leitao/ha-mais-de-um-smartphone-por-habitante-no-brasil/;
* Flutter, agora com sua versão 2.0, permite escalabilidade futura para web, linux, windows e mac;

A interface de login e cadastro deve ser feita igual ao do site da Bemol, manter a identidade visual e seguir padrões já conhecidos pelo usuário permite que o usuário tenha uma experiência unificada.

### Data Base:
Optei por utilizar o Firebase, as razões são:
* Como meu foco principal é a aplicação front e a comunicação com o banco de dados, o Firebase permitirá economizar tempo no desenvolvimento do DB;
* Já é bem estruturado:
  * possui uma boa criptografia de acesso;
  * validação no envio dos dados para o banco, e em caso de falha, mantém o dado localmente;
  * por padrão usa singleton.
* Utiliza NoSQL. Considero essa uma boa alternativa quando o objetivo é escalabilidade por manter alterações na estrutura do banco sem necessitar atualizar todos os dispositivos que o utilizam. Um aparelho mais antigo ou desatualizado continua funcionando normalmente, mesmo sem as novas funcionalidades ou novos canais de comunicação. Claro, manter todo mundo funcionando pode ser trabalhoso, mas a escalabilidade é facilitada.
