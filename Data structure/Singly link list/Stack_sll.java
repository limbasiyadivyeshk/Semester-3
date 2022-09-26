import java.util.Scanner;

class Stacksll {
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
        Node nnode=new Node(n);
        if(head==null){
            head=nnode;
            tail=nnode;
            return head;
        }
     tail.next=nnode;
     tail=nnode;
     return tail;
    }

    Node delete(){
        Node temp1=head;
        Node temp2=temp1.next;
        while(temp2!=null)
        {
            temp2=temp1.next;
           if(temp2==tail) {
            temp1.next=null;
            tail=temp1;
            return temp2;
           }
           temp1=temp1.next;
        } 
        return null;
    }

    void push(int n) {
        
        top = insert(n);
    }

    int pop() {
        if (top == null) {
            System.out.println("Stack Underflow");
            return 0;
        } else {
            temp = top;
            top = delete();
            return temp.value;
        }
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

public class Stack_sll{
    public static void main(String[] args) {
        Scanner sc= new Scanner(System.in);
        Stacksll ss= new Stacksll();
        System.out.print("Enter no. of Stack element : ");
		int n = sc.nextInt();

		for(int i=1;i<=n;i++){
			System.out.print("Enter element of Stack : ");	
			ss.push(sc.nextInt());
		}
        ss.pop();
		ss.display();


    }
}