# Maze formats

THey are 2 "standard" maze formats: human readable and numeric.

## Human readable format

- `.txt` file
- maze cells are 5 spaces wide and 3 spaces high
- any characters can be used as the walls

### Example

```
+---+---+---+
|       |   |
+   +   +   +
|   |       |
+---+---+---+
```

## Numeric format

- typically uses the extension `.num`
- each line encodes one cell
- the values are stored in the order: x, y, N, E, S, W
- x and y are the coordinates
- NESW are bool values stating whether there is a wall on that side

### Example

This is the same maze as before.

```
0 0 0 1 1 1
0 1 1 0 0 1
1 0 0 0 1 1
1 1 1 1 0 0
2 0 0 1 1 0
2 1 1 1 0 1
```
