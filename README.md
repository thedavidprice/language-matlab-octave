# Atom.io Package for MATLAB and Octave Language Support

## Version 1.0.0+ Major Update
**Breaking change:** as of v1 release August 2019, migrated MATLAB grammar source from TextMate to official MATLAB support mathworks/MATLAB-Language-grammar. This fixed many reported issues and improved MATLAB highlighting to match official [github/linguist](https://github.com/github/linguist) used on Github.com.

Octave grammar source remains unchanged.

### Octave language support (v0.2.0+)
Octave grammar is converted from TextMate Bundle and remains unchanged from v0 to v1. Last update was v0.2. See:
https://github.com/textmate/matlab.tmbundle

### MATLAB language Support (v1.0.0+)
The syntax highlighting comes from the MathWorks TextMate grammar:
https://github.com/mathworks/MATLAB-Language-grammar

#### Commit Hash: MATLAB-Language-grammar used for current grammar version
https://github.com/mathworks/MATLAB-Language-grammar/tree/5915f67761daa34b5f0fb9daf3d266198219a472

#### Screenshot Example: preview of included file `highlighting-test.m`_
![language-matlab-octave-highlighting](https://user-images.githubusercontent.com/43882944/61577281-29e12680-aab3-11e9-900d-527a0afa8e37.png)


## Process for Updating MATLAB Grammar
### Converting the MathWorks TextMate Grammar
1. Clone, convert, and update the grammar:
    ```bash
    git clone git@github.com:mathworks/MATLAB-Language-grammar.git
    apm init --package language-matlab-temp --convert MATLAB-Language-grammar/Matlab.tmbundle/
    cp language-matlab-temp/grammars/matlab.cson language-matlab-octave/grammars/m.cson
    ```

1. Apply an Atom-specific patch to the file `language-matlab-octave/grammars/m.cson`:
    * Change `name: "meta.class.matlab"` to `name: ""`. This prevents atom from improperly coloring all class contents.

1. Re-add function highlighting into updated `language-matlab-octave/grammars/m.cson`:
    * MATLAB-Language-grammar does not highlight MATLAB functions exactly like the TextMate grammar. If you view the diff of the newly generated `language-matlab-octave/grammars/m.cson`, you'll see the functions to add back.
    * For convenience, these are included as reference in `language-matlab-octave/grammars/functions-reference.cson`. Use this file to update `patterns:` and `repository:` sections of the new `m.cson`.

### Testing/Verifying Grammar Changes
See the MATLAB file `highlighting-test.m` for MATLAB code snippets to test syntax highlighting changes. Supposing you've updated `grammars/m.cson` you can test your changes by doing the following:
```bash
cd your-repo-clone
apm remove language-matlab-octave
apm link .
atom .
```
Open `highlighting-test.m` and ensure that the syntax highlighting is as desired. If you fix something specific, consider adding a code snippet to that file locking down your change for future testing.
