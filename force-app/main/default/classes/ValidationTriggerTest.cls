// classe de teste

@IsTest
public class ValidationTriggerTest {

    @IsTest
    static void devePermitirPrimeiraTarefa() {
        
        Case casoTeste = new Case(Subject = 'Caso de Teste - 1', Status = 'New', Origin = 'Web');
        insert casoTeste;

        Task t1 = new Task(Subject = 'Tarefa 1', WhatId = casoTeste.Id, Status = 'Not Started');
        
        Test.startTest();
        insert t1;
        Test.stopTest();

        List<Task> tarefasInseridas = [SELECT Id FROM Task WHERE WhatId = :casoTeste.Id];
        System.assertEquals(1, tarefasInseridas.size(), 'A primeira tarefa deveria ter sido inserida com sucesso.');
    }

    @IsTest
    static void deveBloquearSegundaTarefa() {
        Case casoTeste = new Case(Subject = 'Caso de Teste - 2', Status = 'New', Origin = 'Web');
        insert casoTeste;
        
        Task t1 = new Task(Subject = 'Tarefa 1', WhatId = casoTeste.Id, Status = 'Not Started');
        insert t1;

        // 2. Ação: Tenta inserir a segunda tarefa
        Task t2 = new Task(Subject = 'Tarefa Duplicada', WhatId = casoTeste.Id, Status = 'Not Started');
        
        Boolean erroDisparado = false;
        
        Test.startTest();
        try {
            insert t2;
        } catch (DmlException e) {
            erroDisparado = true;
            System.assert(e.getMessage() != null, 'A trigger deveria ter disparado um erro.');
        }
        Test.stopTest();

        System.assert(erroDisparado, 'A trigger deveria ter bloqueado a segunda tarefa e lançado um erro.');
    }
}