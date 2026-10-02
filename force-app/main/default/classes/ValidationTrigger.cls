public class ValidationTrigger extends TriggerHandler{
    public override void beforeInsert(){
        List<Task> tarefas = (List<Task>)Trigger.new;
        Set<Id> idCasos = new Set<Id>();

        for (Task t : tarefas) {
            if (t.WhatId != null && String.valueOf(t.WhatId).startsWith('500')) {
                idCasos.add(t.WhatId);
            }
        }

        if(idCasos.isEmpty()){return;}

        Set<String> statusEmAberto = new Set<String>{'Not Started', 'In Progress', 'Waiting on someone else', 'Deferred'};

        Map<Id, Integer> qtdTarefaAbertas = new Map<Id, Integer>();
        for (Task tarefaExistente : [SELECT Id, WhatId FROM Task WHERE WhatId IN :idCasos AND Status IN :statusEmAberto]) {
            Integer qtd = qtdTarefaAbertas.get(tarefaExistente.WhatId);
            if (qtd == null) {
                qtdTarefaAbertas.put(tarefaExistente.WhatId, 1);
            } else {
                qtdTarefaAbertas.put(tarefaExistente.WhatId, qtd + 1);
            }
        }

        Set<Id> casoTarefaAberto = new Set<Id>();
        for (Task t : tarefas) {
            if (t.WhatId != null && idCasos.contains(t.WhatId)) {
                Boolean temNoBanco = qtdTarefaAbertas.containsKey(t.WhatId);
                Boolean duplicada = casoTarefaAberto.contains(t.WhatId);
                
                if (temNoBanco || duplicada) {
                    t.Subject.addError('Task ja existe, finalize-a antes de prosseguir');
                    t.addError('Já existe uma tarefa em aberto nesse caso. Encerre-a antes de abrir uma nova.');
                }else{
                    casoTarefaAberto.add(t.WhatId);
                }
            }
        }
    }
}

