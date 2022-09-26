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

    void insertatfirst(int n){
        Node nnode=new Node(n);
        if(head==null){
            head=nnode;
            tail=nnode;
            return;
        }
        nnode.next=head;
        head=nnode;
    }

    void insertatlast(int n){
        Node nnode=new Node(n);
        if(head==null){
            head=nnode;
            tail=nnode;
            return;
        }
     tail.next=nnode;
     tail=nnode;
    }

    int deleteatfirst(){
        int temp1=head.value;
        head=head.next;
        return temp1; 
    }
    int deleteatlast(){
        Node temp1=head;
        Node temp2=temp1.next;
        while(temp2!=null)
        {
            temp2=temp1.next;
           if(temp2==tail) {
            temp1.next=null;
            tail=temp1;
            return temp2.value;
           }
           temp1=temp1.next;
        } 
        return 0;
    }

    int deleteatgametya(int n){
		Node lastNode = head;
		Node prev=null;
		if(lastNode.value==n){
			System.out.println("abc");
				head=lastNode.next;
                return lastNode.value;
		}
		else{
			while(lastNode.next!=null){
			 if(lastNode.value==n){
				prev.next=lastNode.next;
				System.out.println("matched");
				return lastNode.value;
				} 	
				prev=lastNode;
				lastNode=lastNode.next;	
			}
			if(lastNode.value==n){
				prev.next=null;
                return lastNode.value;
			}
		}
		return 0;
}

    void display(){
        Node temp = head;
        while(temp != null){
            if(temp==tail){
            System.out.print(" " + temp.value);
            }
            else{
                System.out.print(" " + temp.value + "-> ");               
            }
            temp=temp.next;
        }
        System.out.println();
    }
}

public class Nodecreate{
    public static void main(String[] args){
        Link ln = new Link();
        ln.insertatfirst(3);
        ln.insertatfirst(2);
        ln.insertatfirst(1);
        ln.insertatlast(4);

        // int a=ln.deleteatfirst();
        // System.out.println(a);
        // int b=ln.deleteatlast();
        // System.out.println(b);
        ln.display();
        int c=ln.deleteatgametya(3);
        System.out.println(c);
        ln.display();
    }
}