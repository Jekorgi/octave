function [Scores, Iterations, FinalScore]=aitken(x,y,a) % Zwraca: Wyniki w postaci macierzy // Wymaga: macierz x, macierz y, punkt a
  W = [1]; %Liczba kolumn oznacza aktualną liczbę iteracji
  Scores = []; %Ostateczna macierz, wyniki z TempScores trafiają tutaj
  TempScores = []; %Wszystkie wyniki najpierw trafiają do tymczasowej macierzy
    
  i=0;
  while(columns(W) != columns(x)) % Wykonuj dopóki liczba kolumn W (patrz powyżej) jest inna niż liczba kolumn X
    i++;

    if((i)==columns(x))
      W = [[W], 2];
      i=columns(W)-1;
      for in = rows(TempScores):rows(Scores)-1 %Uzupełnij puste miejsca liczbą 0 aby uniknąć błędu o niezgodnym wymiarze macierzy
        TempScores = [0;TempScores];
      endfor
      Scores=[[Scores], TempScores]; %Dodaj wyniki z obecnej iteracji do macierzy z ostatecznymi wynikami
      TempScores=[]; %Zresetuj macierz tymczasową
    else
      %Pierwsza iteracja na podstawowych danych.
      if(columns(W) == 1)
        TempScores=[TempScores;((y(columns(W))*(x(i+1)-a))-(y(i+1)*(x(columns(W))-a)))/(x(i+1)-x(columns(W)))];
      else %Pozostałe iteracje na wynikach poprzednich iteracji
        TempScores=[TempScores;((Scores(columns(W)-1,columns(W)-1)*(x(i+1)-a))-(Scores(i, columns(W)-1)*(x(columns(W))-a)))/(x(i+1)-x(columns(W)))];
      endif
    endif
  endwhile
  Iterations = columns(W)-1;
  FinalScore = Scores(columns(W)-1, columns(W)-1);
endfunction
