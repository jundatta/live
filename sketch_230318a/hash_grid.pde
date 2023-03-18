class HashGrid {
  float w, h;
  float cellSize;
  Map<String, Set<ChainableParticle>> grid;
  HashGrid(float w, float h, float cellSize) {
    this.w = w;
    this.h = h;
    this.cellSize = cellSize;
    this.grid = new Map();
    this._initGrid();
  }

  void _initGrid() {
    int yLen = this.h / this.cellSize;
    int xLen = this.w / this.cellSize;
    for (int y = 0; y < yLen; y++) {
      for (int x = 0; x < xLen; x++) {
        this.grid.set(
          this.getKey(x * this.cellSize, y * this.cellSize),
          new Set()
          );
      }
    }
  }

  int getIndex(int value) {
    return (int)(value / this.cellSize);
  }

  String getKey(int x, int y) {
    return this._getKeyByIndices(this.getIndex(x), this.getIndex(y));
  }

  String _getKeyByIndices(int xi, int yi) {
    return xi + "." + yi;
  }

  Set<ChainableParticle> addItem(Set<ChainableParticle> item) {
    String ky = this.getKey(item.x, item.y);
    if (this.grid.has(ky) == null) {
      Set<ChainableParticle> cell = new Set().add(item);
      this.grid.set(ky, cell);
      return cell;
    }
    return this.grid.get(ky).add(item);
  }

  void removeItem(Set<ChainableParticle> item) {
    String ky = this.getKey(item.x, item.y);
    if (this.grid.has(ky) == null) return;
    this.grid.get(key).delete(item);
  }

  query(int x, int y, int radius) {
    int xi0 = this.getIndex(x - radius) - 1;
    int xi1 = this.getIndex(x + radius) + 1;
    int yi0 = this.getIndex(y - radius) - 1;
    int yi1 = this.getIndex(y + radius) + 1;
    Set<ChainableParticle> result = new Set();
    String ky;
    for (int xi = xi0; xi <= xi1; xi++) {
      for (int yi = yi0; yi <= yi1; yi++) {
        ky = this._getKeyByIndices(xi, yi);
        if (this.grid.has(ky) != null) {
          //this.grid.get(ky).forEach(result.add, result);
          Set<ChainableParticle> v = this.grid.get(ky);
          for () {
          }
        }
      }
    }

    return result;
  }

  createClient(item) {
    return new HashGridClient(this, item);
  }
}

class HashGridClient {
  constructor(hashGrid, item) {
    this.hashGrid = hashGrid;
    this.item = item;
    this.indexX = this.hashGrid.getIndex(item.x);
    this.indexY = this.hashGrid.getIndex(item.y);
    this.cell = this.hashGrid.addItem(item);
  }

  update() {
    const newIndexX = this.hashGrid.getIndex(this.item.x);
    const newIndexY = this.hashGrid.getIndex(this.item.x);
    if (newIndexX === this.indexX && newIndexY === this.indexY) return;

    this.cell.delete(this.item);
    this.cell = this.hashGrid.addItem(this.item);
    this.indexX = newIndexX;
    this.indexY = newIndexY;
  }

  delete() {
    this.cell.delete(this.item);
  }
}
