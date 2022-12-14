class Linklist{
    Node head,tail;
    int count=0;
    class Node{
        Node rptr,lptr;
        int data;
        Node(int m){
            this.rptr=null;
            this.lptr=null;
            this.data=m;
        }
    }

    void insertatfirst(int n){
        Node nnode=new Node(n);
        if(head==null){
            head=nnode;
            tail=nnode;
            count++;
            return;
        }

        nnode.rptr=head;
        head.lptr=nnode;
        head=nnode;
        count++;
    }

    void insertatlast(int n){
        Node nnode=new Node(n);
        if(head==null){
            head=nnode;
            tail=nnode;
            count++;
            return;
        }

        nnode.lptr=tail;
        tail.rptr=nnode;
        tail=nnode;
        count++;

    }
    void insertatgametya(int n,int p){//pera1 mare shu insert carvu che. pear2 mare kai position upar insert karvu che teni pela nu. 
        Node nnode= new Node(n);
        Node temp=head;
        Node temp1=head.rptr;
        if(head==null){
            head=nnode;
            tail=nnode;
            return;
        }
        while(temp.rptr!=null){
            if(temp.data==p){
                nnode.rptr=temp1;
                nnode.lptr=temp;
                temp.rptr=nnode;
                temp1.lptr=nnode;
                return;
            }
            temp=temp.rptr;
            temp1=temp.rptr;
        }
        nnode.lptr=tail;
        tail.rptr=nnode;
    }

    int deleteatposition(int n){
        Node temp=head;
        Node temp2;
        if(temp==null){
            System.out.println("Node Empty");
            return 0;
        }
        if(head.data==n){
                head=head.rptr;
                head.lptr=null;
                return temp.data;
        }
        while(temp!=null){
            if(temp.data==n){
                if(temp==tail){
                    tail=temp.lptr;
                    tail.rptr=null;
                    return temp.data;
                }
                else{
                    temp2=temp;
                    temp=temp.rptr;
                    temp=temp2.lptr;
                    return temp2.data;
                }
            }
            temp=temp.rptr;
        }
        return 0;
    }

     void deleteSpecified(int position){
        if(head == null){
            System.out.println("List is Empty!");
            return;
        }

        if(position == 1){
            head = head.rptr;
            return;
        }
        else{
            Node pred = head;
            int count = 1;
            while(count < position-1){
                pred = pred.rptr;                
                count++;
            }
            if(pred.rptr == tail){
                pred.rptr = null;
                return;
            }
            Node currNode = pred.rptr;
            pred.rptr = currNode.rptr;
            currNode.rptr.lptr = pred;
        }
    }


    void displaynode(){
        Node temp=head;
        if(temp==null){
            System.out.println("node is empty");
            return;
        }
        while(temp.rptr!=null){
            System.out.print(" "+temp.data+" <->");
            temp=temp.rptr;
            
        }
        System.out.print(" " + temp.data);
    }
}


public class Doubly_linkedlist {
    public static void main(String[] args) {
        Linklist ln = new Linklist();
        ln.insertatfirst(1);
        ln.insertatlast(2);
        ln.insertatfirst(0);
        ln.insertatlast(3);
        // ln.insertatgametya(4, 3);
        ln.deleteSpecified(4);
        ln.displaynode();
    }
}
