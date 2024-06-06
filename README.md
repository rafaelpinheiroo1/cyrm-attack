# CyRM-Attack

O CyRM é uma ferramenta de cyber range projetada para criar ambientes virtualizados e controlados, permitindo a simulação e emulação de cenários reais de ataques cibernéticos. Além de acompanhar exercícios práticos, ele simplifica a configuração do treinamento ao integrar o conteúdo didático com a gestão do ambiente, incluindo questões guiadas.


## Ataques em um ambiente corporativo

### CENÁRIO

A **TECHNICAL INTELLIGENCE LTDA** é uma empresa inovadora de tecnologia dedicada a fornecer soluções de computação em nuvem de ponta para empresas de todos os portes. Nossa missão é alcançar agilidade, eficiência e escalabilidade por meio da adoção inteligente da computação em nuvem. Sua matriz está localizada na américa do sul. Com clientes em todo o continente americano e está abrangendo os continentes europeu e africano.

Segue a topologia da rede:

![cyrm_topology_attack](https://github.com/rafaelpinheiroo1/cyrm-attack/assets/14240615/e1a22566-7be1-44b5-925c-0175ab2c264b)

<!-- <div align-"center"> -->
<!-- <img src="https://user-images.githubusercontent.com/14240615/195457976-fbc519e4-2600-4dc5-8a71-537615418a08.png" width-"7px" /> -->
<!-- </div> -->

A infrestrutura de rede contêm 4 VLANs (Virtual Local Area Network): **DMZ 01 (Demilitarized Zone), DMZ 02, USUÁRIOS e BLUE TEAM (suporte).**

- A **DMZ 01** consiste em uma VLAN **Intranet**,  ou seja só é acessível na rede interna, com a sub-rede **10.0.30.0/24**. Nela, existe apenas um servidor de arquivos **Samba** que é responsável pelo compartilhamento interno de arquivos, diretórios entre os funcionários da empresa. Seu endereço IP é o **10.0.30.100 (servSamba)** e está conectado ao switch **s3**.

- A **DMZ 02** consiste em uma VLAN **Extranet**, com a sub-rede **100.0.0.0/24 (IPs válidos)**. Nela, existe apenas um servidor **Web** que tem por finalidade fornecer os serviços de armazenamento da empresa na **Internet**, de forma que os clientes possam acessar de qualquer lugar. O endereço do servidor é **100.0.0.101 (servWeb)** e está conectado ao switch **s4**.

- A VLAN **USUÁRIOS** consiste em uma rede interna privada que engloba os funcionários da empresa responsáveis por tratar assuntos com os clientes, dando suporte e sempre solucionando as pendências. Para tanto, foi alocada a sub-rede **10.0.20.0/24** e as máquinas (**5 PCs**) estão conectadas ao switch **s2**.

- A VLAN **BLUE TEAM** consiste em uma rede interna privada que engloba os funcionário do suporte técnico. Tais funcionários são responsáveis pela administração e gerência de toda a infraestrutura da rede, servidores e terminais. Com grande responsabilidade em deixar o serviço das aplicações disponíveis e resolver qualquer problema que acontecer na infraestrutura. Para tanto, foi alocada a sub-rede **10.0.10.0/24** e as máquinas devem ser conectadas ao switch **s1**. Nesta VLAN, existe apenas uma estação de trabalho com endereço **10.0.10.100 (suporte)**.

- O roteador **r0** tem por objetivo provê a interconectividade entre todos as VLANs e a Internet. O **r0** consite em um roteador baseado em linux com um firewall integrado (**netfilter/iptables**), destinado a filtrar o tráfego passante.

### QUESTIONÁRIO GUIADO

No diretório **moodle** contém o questionário guiado para execução do treinamento contendo todas as informações necessárias, dicas, imagens da topologia em todas as questões e são mostradas uma por página. No formato Extensible Markup Language (XML), no entanto, realize o download do questionário e importe no moodle ou se preferir pode criar o próprio questionário. 


#### PROCEDIMENTO PARA IMPORTAR QUESTOES NO MOODLE

1) Acesse a turma em que deseja importar o banco de questões, clique no "Menu Ações" (representado pelo ícone de engrenagem) e depois clica na opção "Mais… "
2) Em "Banco de Questões" , clique em "Importar".
3) Marque o formato do questionario que é em XML. (Formato Moodle XML)
4) Posteriomente clique em "Escolha um arquivo..."
5) Em "Enviar um arquivo" clique em "Escolher arquivo". Após selecionar o arquivo salvo no seu computador conforme o passo de Exportação clique em "Enviar este arquivo".
6) Verifique se o formato de arquivo corresponde ao da Exportação e clique "Importar".
7) Será exibido um relatório com as questões importadas. Clique em "Continuar".
8) Pronto! As questões já se encontram disponíveis na turma atual, para acessá-las basta selecionar a categoria utilizada. Caso não tenha utilizado um nome especifico para categoria, as questões estarão na categoria com o nome da turma de origem.

<!-- ### REQUISITO PARA USABILIDADE -->

### TREINAMENTO

Este treinamento tem por objetivo a realização de exercícios simulados voltados para a detecção, diagnóstico e mitigação de ataques que estejam ocorrendo no cenário acima. Para tanto, usaremos o CyRM, um Cyber Range que utiliza o [Containernet](https://github.com/containernet/containernet) para emular a topologia de rede acima, bem como ataques direcionados a esta rede.

Para executar o cenário, siga a sequência passos a seguir. 

1) Abra seu terminal linux (teclas de atalho CTRL+ALT+T)

2) Clone a ferramenta do GitHub.

```
$ git clone https://github.com/rafaelpinheiroo1/cyrm-attack.git
```
3) Entre na pasta cyrm-attack.

4) Execute o script `environment_preparation.sh` para para a instação das dependência. Aguarde até a finalização do procedimento.
```
$ sudo ./environment_preparation.sh
```
5) Execute o script `start_cyrm.sh` para inicializar o ambiente. Aguarde até aparecer o CLI do containernet.
```
$ sudo ./start_cyrm.sh
```

**E pronto! Podemos começar a resolver este questionário! Opa, mas espere! Antes de iniciarmos o treinamento, seguem algumas dica de uso do CLI do containernet:**

### USANDO O CYRM ATTACK 

Para **executar os comandos nos dispositivos**, primeiramente digite o hostname que deseja e, logo após, o comando desejado, conforme o modelo a seguir:

`containernet> <hostname> comando` (executando comandos localmente em um host específico)

Seguem alguns exemplos:

`containernet> suporte ifconfig` (exibe o estado das interface de rede do hostname suporte)

`containernet> saulo ps aux` (demonstra quais os processos estão ativo no hostname saulo)

`containernet> servWeb cat arquivo.txt` (exibe o que tem no arquivo de texto no hostname servWeb)

Além disso, caso queria **simular a desconexão de cabos entre dois dispositivos**, basta digitar o comando abaixo:

`containernet> link <node1> <node2> down` (simulando a desconexão de cabos entre dois nós da topologia)

Finalmente, para **encerrar o cenário**, siga os seguintes passos:

1) Digite exit para sair do cenário.

`containertnet> exit`

Observação: Se caso o cenário travar, pressione CTRL + C para cancelar o processo.

2) Após o encerramento ser concluído, exclua todas as configurações do cenário anterior com o script `clean_cyrm.sh`.
```
$ sudo ./clean_cyrm.sh
```
