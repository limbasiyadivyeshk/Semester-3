class Link{
    Node head,tail;
    class Node{
        Node next;
        int value;
        Node(int n){
            this.value=n;
            this.next=null;
        }
    }
    int size = 0;

    void insertatfirst(int n){
        Node nnode=new Node(n);
        size++;
        if(head==null){
            head=nnode;
            tail=nnode;
            return;
        }
        nnode.next=head;
        head=nnode;
        tail.next=head;
    }

    void insertatlast(int n){
        Node nnode=new Node(n);
        size++;
        if(head==null){
            head=nnode;
            tail=nnode;
            return;
        }
     tail.next=nnode;
     nnode.next=head;
     tail=nnode;
     return;
    }

    int deleteatfirst(){
        if(head==null){
            System.out.println("list is empty");
            return 0;
        }
        int temp1=head.value;
        head=head.next;
        tail.next=head;
        size--;
        return temp1; 
    }
    int deleteatlast(){
        if(head==null){
            System.out.println("list is empty");
            return 0;
        }
        Node temp1=head;
        Node temp2=head.next;
        while(temp2!=null)
        {
            temp2=temp1.next;
           if(temp2==tail) {
            temp1.next=head;
            tail=temp1;
            size--;
            return temp2.value;
           }
           temp1=temp1.next;
        } 
        return 0;
    }

    public void deleteSpecified(int position){
        if(head == null){
            System.out.println("List is Empty!");
            return;
        }
        size--; 
        if(position == 1){
            head = head.next;
            tail.next = head;
            return;
        }  
        Node temp1=head;
        Node temp2=head.next;
        if(size+1 == position){
            
            while(temp2!=null)
            {
                temp2=temp1.next;
               if(temp2==tail) {
                temp1.next=head;
                tail=temp1;
                size--;
                return;
               }
               temp1=temp1.next;
            } 
        }
        else{
        for(int i=2;i<size+1;i++){
            if(i == position){
                temp1.next = temp2.next;
                return;
            }
            temp2 = temp2.next;
            temp1 = temp1.next;
        } 
    } 
    }

    void display(){
        Node temp = head;
        while(temp != null){
            if(temp==tail){
            System.out.print(" " + temp.value);
            return;
            }
            else{
                System.out.print(" " + temp.value + "-> ");               
            }
            temp=temp.next;
        }
    
    }
}

public class Cir_linklist{
    public static void main(String[] args){
        Link ln = new Link();
        ln.insertatlast(1);
        ln.insertatlast(2);
        ln.insertatlast(3);
        ln.insertatlast(4);

        // ln.deleteatfirst();
        // ln.deleteatlast();
        // ln.display();

        ln.deleteSpecified(1);
        ln.display();
        // System.out.println(a);
    }
}