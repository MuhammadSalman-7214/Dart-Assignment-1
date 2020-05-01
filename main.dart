import 'dart:io';
import 'dart:convert';
import 'dart:async';
import 'dart:collection';

main() {
  Solution obj = new Solution();
   obj.calculateLineWithHighestFrequency();
   obj.printHighestWordFrequencyAcrossLines();

}

class Solution {
  
  void printHighestWordFrequencyAcrossLines() {
    final file = new File('file.txt');
    var lines = file.readAsLinesSync();
    var var1 = lines[0].split(" ");
    var var2 = lines[1].split(" ");
    var var3 = lines[2].split(" ");
    var words = List<String>();
  
    words.addAll(var1);
    words.addAll(var2);
    words.addAll(var3);

    var linenumbertrack=new HashMap<String , String>();
            String word = "";    
            int count = 0, maxCount = 0;
        //Determine the most repeated word in a file    
        for(int i = 0; i < words.length; i++){    
            count = 1;    
            //Count each word in the file and store it in variable count    
            for(int j = i+1; j < words.length; j++){    
                if(words[i] == words[j]){    
                    count++;    
                }     
            }    

            //If maxCount is less than count then store value of count in maxCount     
            //and corresponding word to variable word    
            if(count > maxCount && count != 1){    
                maxCount = count;    
                word = words[i];    
            }    
        }    

      print('Most Repeated Word: ${word} and max count is ${maxCount}');
  }
  
  void calculateLineWithHighestFrequency() {

    final file = new File('file.txt');
    Stream<List<int>> inputStream = file.openRead();
        inputStream
        .transform(utf8.decoder)       // Decode bytes to UTF8.
        .transform(new LineSplitter()) // Convert stream to individual lines.
        .listen((String line) {        // Process results.
          List<String> words = line.split(" ");
          String word = "";    
          int count = 0, maxCount = 0;
          //Determine the most repeated word in a file    
          for(int i = 0; i < words.length; i++) {    
              count = 1;    
              //Count each word in the file and store it in variable count    
               for(int j = i+1; j < words.length; j++){    
                 if(words[i] == words[j]){    
                    count++;    
                  }     
              }    

              //If maxCount is less than count then store value of count in maxCount     
              //and corresponding word to variable word    
              if(count > maxCount && count != 1){    
                maxCount = count;    
                word = words[i];    
              }    
        }    

      print('Most Repeated Word: ${word} and max count is ${maxCount}');
      },
      onDone: () { print('File is now closed.'); },
      onError: (e) { print(e.toString()); });
}

}