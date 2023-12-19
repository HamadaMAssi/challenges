import 'package:dart_application/dart_application.dart' as dart_application;
import 'package:dart_application/stack.dart';
import 'package:dart_application/linked_list.dart';


void main(List<String> arguments) {
  // Stacks
  // Challenge 1: Reverse a List 
  // Create a function that prints the contents of a list in reverse order.

  print("Challenge 1: Reverse a List");
  List<int> myTest = [2,4,6,8,10];
  printReversed(myTest);
  print("_______________________");
  
  // Challenge 2: Balance the Parentheses 
  // Check for balanced parentheses. Given a string, 
  //check if there are ( and ) characters, and return true if the parentheses 
  //in the string are balanced. 
  print("Challenge 2: Balance the Parentheses");
  print(balancedParentheses('h((e))llo(world)()'));
  print(balancedParentheses('(hello world'));

  // Linked List
  // Challenge 1: Print in Reverse 
  //  Create a function that prints the nodes of a linked list in reverse order. 
  print("Linked List");
  print("Challenge 1: Print in Reverse ");
  final list = LinkedList<int>();
  list.push(3);
  list.push(2);
  list.push(1);
  print('Reversed List:');
  printReverseLinkedList(list);
  print("_______________________");
  // Challenge 2: Find the Middle Node 
  // Create a function that finds the middle node of a linked list. 
  print("Challenge 2: Find the Middle Node");
  final list2 = LinkedList<int>();
  list2.push(1);
  list2.push(2);
  list2.push(3);
  list2.push(4);
  list2.push(5);
  list2.push(6);
  list2.push(7);

  final middleNode = findMiddleNode(list2);
  print('the middle node: ${middleNode?.value}'); // Output: Middle Node 1: 3

  print("_______________________");
  // Challenge 3: Reverse a Linked List  
  // Create a function that reverses a linked list. You do this by manipulating 
  //the nodes so that they’re linked in the other direction. 
  print("Challenge 3: Reverse a Linked List");
  print('before $list2');
  reverseLinkedList(list2);
  print('after $list2');
  print("_______________________");
  // Challenge 4: Remove All Occurrences 
  //  Create a function that removes all occurrences of a specific element from 
  //a linked list. The implementation is similar to the removeAfter method that you implemented earlier.
  print("Challenge 4: Remove All Occurrences");

  final test4 = LinkedList<int>();
  test4.push(4);
  test4.push(3);
  test4.push(3);
  test4.push(2);
  test4.push(1);
  removingOccurrences(test4,3);
  print("_______________________");
}

void printReversed(List<dynamic> inputList){
  // convert list to stack
  final stack = Stack.of(inputList);
  while(stack.isNotEmpty){
    print(stack.pop());
  }
}

String balancedParentheses(String str){

  Map<String, String> sampleMap = {
    ')': '(',
    '}': '{',
    ']': '[',
  };

  if(!str.contains(RegExp('[(){}\\[\\]]'))){
    return "$str does not contains parentheses"; 
  }else{
    final stack = Stack<String>();
    for (int i = 0; i <str.length; i++){
      if(str[i] == '(' || str[i] == '{' || str[i] == '['){
        stack.push(str[i]);
      }else if( str[i] == ')' || str[i] == '}' || str[i] == ']' ){
        // Unbalanced: Closing parenthesis without a matching opening parenthesis
        if(stack.isEmpty){
          return "$str is unbalanced parentheses!";
        }else if(stack.pop() != sampleMap[str[i]]){
          return "$str is unbalanced parentheses!";
        }
      }
    }
    return stack.isEmpty? "$str is balanced parentheses!" : "$str is unbalanced parentheses! 2";
  }
}

void printReverseLinkedList(LinkedList<int> inputList){
  final list = LinkedList<int>();
  for (final e in inputList) {
    list.push(e);
  }
  while(list.isNotEmpty){
    print(list.pop());
  }
}

Node<T>? findMiddleNode<T>(LinkedList<T> list) {
  if (list.isEmpty) {
    return null;
  }
  // To get to the middle, 
  // we need to walk half the steps needed to reach the end
  var middlePointer = list.head; // walk one step at a time
  var tailPointer = list.head; // walk two steps at a time
  while (tailPointer?.next != null && tailPointer?.next?.next != null) {
    middlePointer = middlePointer?.next;
    tailPointer = tailPointer?.next?.next;
  }
  return middlePointer;
}

void reverseLinkedList<T>(LinkedList<T> list){
  Node<T>? oldNode;
  Node<T>? current = list.head;
  Node<T>? nextNode;
  while (current != null){
    nextNode = current.next;
    current.next = oldNode;
    oldNode = current;
    current = nextNode;
  }
  list.head = oldNode;
}

void removingOccurrences<T>(LinkedList<T> list, dynamic val){
  final newList = LinkedList<T>();
  for (final value in list) {
    if(value != val){
      newList.push(value);
    }
  }
  print(newList);
}

