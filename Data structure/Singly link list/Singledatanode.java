import java.util.Scanner;
class Link{
     Node head;
    public class Node{
        Object value;
         Node(Object m){
            this.value=m;
        }
    }
    public void insert(Object m){
        Node mnode = new Node(m);
        head=mnode;
        return;
    }
    public void display(){
        System.out.println(head.value);

    }
}

public class Singledatanode {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
    Link ln=new Link();
    System.out.print("Enter Element = ");
    ln.insert(sc.next());
    ln.display();
    }
}
