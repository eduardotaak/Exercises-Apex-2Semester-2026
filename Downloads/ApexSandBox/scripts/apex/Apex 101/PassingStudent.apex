public Boolean isPassed(Boolean passedExam, Boolean passedAssignments, Boolean passedProject) {
    if(passedExam && passedAssignments){
        return true;
    }
    if(passedAssignments && passedProject){
        return true;
    }
    if(passedProject && passedExam){
        return true;
    }
    return false;
}