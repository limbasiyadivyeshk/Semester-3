class Queue{
    Node head,tail;
    Node top;
    Node temp=null;
    class Node{
        Node next;
        int value;
        Node(int n){
            this.value=n;
            this.next=null;
        }
    }

    Node insert(int n){
        Node nnode = new Node(n);
        if(head==null){
            head=nnode;
            tail=head;
            return head;
        }
        tail.next=nnode;
        tail=nnode;
        return tail;
    }

    Node delete(){
        if(head==null){
            System.out.println("Node Empty");
            return null;
        }
        Node temp=head;
        head=head.next;
        return temp;
    }

    void enqueue(int n){
        top=insert(n);
    }

    Node Dequeue(){
        if(top==null){
            System.out.println("Queue is underflow");
            return null;
        }
        top=delete();
        return top; 
    }

    void display(){
        Node temp=head;
        if(top==null){
            System.out.println("Queue is underflow");
            return;
        }
        while(temp.next!=null){
            System.out.print(" "+temp.value +"-> ");
            temp=temp.next;
        }
        System.out.print(" "+temp.value);
    }
}


public class Queue_sll {
    public static void main(String[] args) {
        Queue qu=new Queue();

        qu.enqueue(1);
        qu.enqueue(2);
        qu.enqueue(3);
        qu.enqueue(4);

        qu.Dequeue();

        qu.display();
    }
}
