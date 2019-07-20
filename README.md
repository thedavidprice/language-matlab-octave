# atom.io language-matlab-octave package

Atom.io language support for Matlab / Octave converted from TextMate Bundle:
https://github.com/textmate/matlab.tmbundle

The syntax highlighting comes from the MathWorks TextMate grammar:
https://github.com/mathworks/MATLAB-Language-grammar

## Release 0.2+
Release version 0.2+ updated using the most recent version of textmate tmbundle (it's, ahem, been about 4 years since last full update, which looks like 2 years out of sync with textmate -- sorry about that). Appears to be mostly minor changes and file formatting updates. Please do report any new issues as/if needed.

## CI Dev Note
Repo contains init travis.yml and setup to run testing on push/PR. However, **no unit tests are run** as this is just a placeholder until tests are written in the future. Might be overkill at this point...

## Converting the MathWorks TextMate Grammar
1. Clone and convert the grammar
    ```bash
    git clone git@github.com:mathworks/MATLAB-Language-grammar.git
    apm init --package language-matlab --convert MATLAB-Language-grammar/Matlab.tmbundle/
    cp language-matlab/grammars/matlab.cson language-matlab-octave/grammars/m.cson
    ```

1. Apply an Atom-specific patch
Change `name: "meta.class.matlab"` to `name: ""`. This prevents atom from improperly coloring of all class contents.

3. Add in function highlighting from functions.cson
MATLAB-Language-grammar does not highlight MATLAB functions like the TextMate grammar. The file `functions.cson` contains the functions from the TextMate grammar to be highlighted. Just add the components of this file to the corresponding places in `grammars/m.cson`.
