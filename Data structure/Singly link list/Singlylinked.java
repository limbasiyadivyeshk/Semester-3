class Linked {
    Node head, tail;

     class Node {
        Node next;
        Object value;

        Node(Object m) {
            this.value = m;
            next = null;
        }
    }

    Node insertatfirst(Object n){
        Node mnode = new Node(n);
        if (head == null) {
            head = mnode;
            tail = mnode;
            return head;
        }
        mnode.next = head;
        head = mnode;
        return head;
    }

    Object deleteatfirst(){
        Object n = head.value;
        head = head.next;
        return n;
    }

}

public class Singlylinked {

    public static void main(String[] args) {
        Linked ln = new Linked();
        ln.insertatfirst(4);
        Object a = ln.deleteatfirst();
        System.out.print(a);
    }
}
