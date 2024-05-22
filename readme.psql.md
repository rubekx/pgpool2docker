### Pré-requisitos

- PostgreSQL instalado e funcionando.
- Acesso de superusuário ou privilégios adequados para modificar configurações do banco de dados.
- Java e Apache Kafka já configurados (necessário para Debezium).

### Etapa 1: Configuração do PostgreSQL

1. **Modificar o Arquivo de Configuração do PostgreSQL**

   Edite o arquivo de configuração `postgresql.conf` localizado geralmente em `/var/lib/postgresql/data/` (o caminho pode variar dependendo da sua instalação):

   ```bash
   sudo nano /var/lib/postgresql/data/postgresql.conf
   ```

   Procure pela configuração `wal_level` e modifique-a para:

   ```
   wal_level = logical
   ```

   Salve e feche o arquivo.

2. **Reiniciar o Serviço PostgreSQL**

   Para que as alterações tenham efeito, reinicie o serviço PostgreSQL:

   ```bash
   sudo systemctl restart postgresql
   ```

### Etapa 2: Adicionar Usuário com Privilégios de Replicação

1. **Acessar o PostgreSQL**

   Acesse o prompt do PostgreSQL com um usuário que tenha privilégios de superusuário, geralmente o usuário `postgres`:

   ```bash
   sudo -u postgres psql
   ```

2. **Criar um Novo Usuário**

   Crie um usuário específico para o Debezium com privilégios de replicação. Substitua `debezium_user` e `debezium_password` pelos nomes de usuário e senha que desejar:

   ```sql
   CREATE ROLE debezium_user WITH LOGIN PASSWORD 'debezium_password' REPLICATION;
   ```

3. **Configurar o pg_hba.conf**

   Adicione uma regra no arquivo `pg_hba.conf` para permitir que esse usuário se conecte de forma segura. Abra o arquivo:

   ```bash
   sudo nano /var/lib/postgresql/data/pg_hba.conf
   ```

   Adicione a seguinte linha ao final do arquivo (ajuste o endereço IP conforme necessário para sua rede):

   ```
   host    replication     debezium_user    127.0.0.1/32            md5
   ou
   host    replication     debezium_user    0.0.0.0/0               md5

   ```
   

   Salve e feche o arquivo, e então reinicie o PostgreSQL para aplicar as mudanças:

   ```bash
   sudo systemctl restart postgresql
   ```

### Conclusão

Com isso, você configurou o ambiente PostgreSQL para suportar a replicação lógica e criou um usuário com os privilégios necessários para o Debezium. O próximo passo seria configurar o conector Debezium no Kafka Connect, que envolveria configurar o Kafka Connect, adicionar o conector Debezium para PostgreSQL, e configurar o conector com as informações do banco de dados e do usuário recém-criado. Se precisar de ajuda para configurar o Debezium no Kafka Connect ou qualquer outro detalhe, fique à vontade para perguntar!