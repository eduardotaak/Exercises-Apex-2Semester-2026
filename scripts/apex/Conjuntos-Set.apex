// verificando o total das taxas das listas conta corrente e conta poupanca
List<Conta> contas  = new List<Conta>();
ContaCorrente cc1 = new ContaCorrente(001, 'maria');
cc1.depositar(100);
contas.add(cc1);

ContaCorrente cc2 = new ContaCorrente(002, 'pedro');
cc2.depositar(100);
contas.add(cc2);

ContaPoupanca cp1 = new ContaPoupanca(003, 'eduardo');
cp1.depositar(1000);
contas.add(cp1);

// adicionando ao Set caso nao exista a o numero da conta
Set<Integer> numContas = new Set<Integer>();
for(Conta conta : contas){
        if(!numContas.contains(conta.numero)){
            numContas.add(conta.numero);
        }
    }

System.debug(numContas);
