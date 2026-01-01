# 📑 DNS Zone Transfer Tester (AXFR)

Este repositório contém um **script simples em Bash** para identificar possíveis vulnerabilidades de **DNS Zone Transfer (AXFR)**.  
O script automatiza a enumeração de servidores DNS autoritativos (NS) de um domínio e tenta realizar a transferência de zona em cada um deles.

---

## 🛠️ Descrição

A **transferência de zona DNS (AXFR)** é um mecanismo legítimo usado para replicar dados entre servidores DNS.  
Quando mal configurada, pode permitir que um atacante obtenha:

- Lista completa de subdomínios  
- Endereços IP internos e externos  
- Informações sensíveis sobre a infraestrutura de rede  

Este script executa automaticamente as seguintes etapas:

- Identifica todos os servidores **NS** do domínio alvo  
- Normaliza e limpa os nomes dos servidores  
- Tenta realizar uma **consulta AXFR** em cada servidor encontrado  

---

## 🚀 Como usar

### 📌 Pré-requisitos

Certifica-te de ter o utilitário `host` instalado:

```bash
sudo apt install bind9-dnsutils
# ou
sudo apt install bind9-host
```
📥 Instalação

Clona o repositório:
```bash
git clone https://github.com/hofuman/ZoneTransfer
```
```bash
cd ZoneTransfer
```

Concede permissão de execução ao script:
```bash
chmod +x transferzone.sh
````
▶️ Execução

Executa o script passando o domínio alvo como argumento:
```bash
./transferzone.sh exemplo.com
```
📋 Exemplo de saída
--- Iniciando teste de Zone Transfer para: exemplo.com ---
Tentando servidor: ns1.exemplo.com
Using domain server:
Name: ns1.exemplo.com
Address: 1.2.3.4#53
Aliases:

exemplo.com has SOA record ns1.exemplo.com. admin.exemplo.com. ...
... (registros de zona se o domínio estiver vulnerável)
----------------------------------------------------


Se a transferência de zona estiver corretamente configurada, o servidor irá recusar a requisição.

⚠️ Aviso Legal (Disclaimer)

Este script foi desenvolvido exclusivamente para fins educacionais e testes de segurança autorizados.

⚠️ É ilegal utilizar esta ferramenta contra domínios ou sistemas sem permissão explícita.
O autor não se responsabiliza por qualquer uso indevido deste software.

📄 Licença

Este projeto está licenciado sob a MIT License.
Consulta o arquivo LICENSE para mais detalhes.
