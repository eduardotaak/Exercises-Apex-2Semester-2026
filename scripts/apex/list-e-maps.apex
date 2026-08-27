List<Conta> contas = new List<Conta>();
ContaCorrente cc1 = new ContaCorrente(001, 'maria');
cc1.depositar(100);
contas.add(cc1);

ContaCorrente cc2 = new ContaCorrente(002, 'pedro');
cc2.depositar(100);
contas.add(cc2);

ContaPoupanca cp1 = new ContaPoupanca(001, 'eduardo');
cp1.depositar(1000);
contas.add(cp1);

Map<Integer, Conta> contasUsers = new Map<Integer, Conta>();
for(Integer i = 0; i < contas.size(); i++){
        contasUsers.put(i, contas[i]);
}

Set<Integer> numeros = new Set<Integer>();
for(Conta conta : contas){
    if(!numeros.contains(conta.numero)){
        numeros.add(conta.numero);
    }
}

contasUsers.keySet().retainAll((numeros));
System.debug(contasUsers);

