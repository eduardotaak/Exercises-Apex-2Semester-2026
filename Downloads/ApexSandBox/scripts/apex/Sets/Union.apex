public Set<Integer> setUnion(Set<Integer> set1, Set<Integer> set2) {
    Set<Integer> s3 = new Set<Integer>(set1);

    s3.addAll(set2);
    return s3;
}