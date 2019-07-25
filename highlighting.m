% 1. Double-quoted strings: https://github.com/JamesRitchie/language-matlab/issues/32
s1 = "a double-quoted string";
c1 = 'a character array';

% 2. %% comment issue: https://github.com/JamesRitchie/language-matlab/issues/28
%% 
y = abs(rand(3)); % make sure this isn't a comment line

% 3. Everything showing up as meta.variable.other.valid.matlab: https://github.com/JamesRitchie/language-matlab/issues/23
someVariable = A\b;

% 4. Highlighting in monokai-dark: https://github.com/JamesRitchie/language-matlab/issues/15
% This isn't valid syntax inside of a script but it still will highlight for testing
classdef aclass
  properties
    prop1
    prop2
  end
  methods
    function y = someMethod(x)
      y = sort(repmat(x,2,3));
    end
  end
end

% 5. fprintf with double quotes: https://github.com/JamesRitchie/language-matlab/issues/10
fprintf(" %d" , decimal)

% 6. Comment blocks: https://github.com/thedavidprice/language-matlab-octave/issues/14
%{
disp('Commented block')
%}

%{/
disp('Active block')
%}
