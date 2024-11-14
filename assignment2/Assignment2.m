%Kiavash Sharifi 9/2/2024 
clear
clc
Ans = input(" welcome to the Tic Tac To game! if you want to play enter 1 or  if not press any other number   ");
if Ans == 1
 disp(" ok let's start the game ") 
 i=1;
 WinnerFlag = false;
 EndGameFlag = false;
 A=zeros(3);
 disp(A)
 Move = input(" If you want to play first enter 1 or  if not press 0   ");
 flag= Move;
 disp(" ok let's start the game ")
 % this "for" loop checks if only 5 moves for the user take place in
 % this game(3x3). otherwise, it will be stuck in a infinite loops.
 while i<6
 %user turn
     if EndGameFlag == false
       if Move == 1 
        disp(" It is your turn ")
        row = input(" Enter the row number that you want  ");
        column = input(" Enter the column number that you want   ");
 %this while check if the choosen row and column is ocuppied       
        while (column < 1 || column > 3 || row < 1 || row > 3 || A(row, column) ~= 0)
           disp(" you entered wrong value. try again ")
           row = input(" Enter the row number that you want, again   ");
           column = input(" Enter the column number that you want, again   ");
        end
 % 1 is your sign in this game 
        A(row, column) = 1;
        i=i+1;
        Move = 0;
       elseif Move == 0
 %pc turn
        r = randi([1,3],1,2);
 %this while check if the pc's choosen row and column is ocuppied 
        if i~=6
           while (A(r(1,1) , r(1,2))~=0)
           r = randi([1,3],1,2);
           end
 % 2 is camputer sign in this game
           A(r(1,1) , r(1,2)) = 2;
           disp(A)
        end
        if i==5 & flag==0
            EndGameFlag = true;
         end 
        Move = 1;
       end   
       % b , c, and d are for my test to make sure if function works
       %because i had problems with this part
       % this part check if there is a winner and also who is the winner
       for p=[1,8]
          if (A(1,1) * A(2,1) * A(3,1) == p) || (A(1,2) * A(2,2) * A(3,2) == p) || (A(1,3) * A(2,3) * A(3,3) == p)
             EndGameFlag = true;
             if p~=8
                WinnerFlag = true;
             end
          elseif (A(1,1) * A(1,2) * A(1,3) == p) || (A(2,1) * A(2,2) * A(2,3) == p) || (A(3,1) * A(3,2) * A(3,3) == p)
             EndGameFlag = true;
             if p~=8
                WinnerFlag = true;
             end
          elseif (A(1,3) * A(2,2) * A(3,1) == p) || (A(1,1) * A(2,2) * A(3,3) == p)
             EndGameFlag = true;
             if p~=8
                WinnerFlag = true;
             end
          end
       end
    
        else
         break
     end   
 end

% I once searched in chatgpt and that was just for the audio samples I used bellow 
% "if" can check if the game is even or tell who is the winner 
 if i==6 & EndGameFlag == false
     disp(A)
     disp(" Even! ")
     load gong        
     sound(y, Fs)  
 elseif WinnerFlag==true
     disp(A)
     disp(" Oh you won congrats! ")
     load handel
     sound(y, Fs)
 elseif WinnerFlag == false & EndGameFlag == true
     disp(A)
     disp(" Oh no you lost ")
     load laughter 
     sound(y, Fs)
 elseif flag==0 & i==5
     disp(A)
     disp(" Even! ")
     load gong        
     sound(y, Fs)
 end
% this section ask user to choose if they want to play again or not
 Ans = input(" That was a good game! if you want to play again enter 1 or if not press 0   ");
if Ans == 1
 run('Assignment2.m')
end

else 
    disp(" Ok! see you next time ")
end

%computer shoro kone o even shin ro emtahan kon 