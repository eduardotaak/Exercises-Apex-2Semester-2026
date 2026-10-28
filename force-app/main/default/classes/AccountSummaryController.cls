public with sharing class AccountSummaryController {

    // esse @AuraEnable e;e é usado para expor os metodos e as propriedades do lado do servidor para componentes de interface tp LWC
    // agr falando mais simples ele so permite um js do proprio LWC chamar um metodo apex no servidor, e esse metodo ele deve ser public static
    @AuraEnabled(cacheable=true)
    public static Integer countOpenCases(Id accountId) {
        return [SELECT COUNT() FROM Case
                WHERE AccountId = :accountId AND IsClosed = false];
    }

    @AuraEnabled(cacheable=true)
    // esse cachable=true meio que o nome explica ele armazena em cache o resultado do navegador, pra melhorar desempenho, e é usado apenas em metodos que vao ler dados como consultas soql que puxam infos
    // pesquisando tb descobri que nao pode usar ele em consulta dml pq o sf bloqueia as operacoes de transacao em cache, pra proteger os dados
    public static Integer countOpenOpps(Id accountId) {
        return [SELECT COUNT() FROM Opportunity
                WHERE AccountId = :accountId AND IsClosed = false];
    }

    @AuraEnabled(cacheable=true)
    public static Integer countWonOpps(Id accountId) {
        return [SELECT COUNT() FROM Opportunity
                WHERE AccountId = :accountId AND IsWon = true];
    }

    @AuraEnabled(cacheable=true)
    public static Integer countClosedOpps(Id accountId) {
        return [SELECT COUNT() FROM Opportunity
                WHERE AccountId = :accountId AND IsClosed = true];
    }
}