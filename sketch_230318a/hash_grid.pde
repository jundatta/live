import java.util.HashSet;

class HashGrid {
  int w, h;
  int cellSize;
  HashMap<String, HashSet<ChainableParticle>> grid;
  HashGrid(int w, int h, int cellSize) {
    this.w = w;
    this.h = h;
    this.cellSize = cellSize;
    this.grid = new HashMap();
    this._initGrid();
  }

  void _initGrid() {
    int yLen = this.h / this.cellSize;
    int xLen = this.w / this.cellSize;
    for (int y = 0; y < yLen; y++) {
      for (int x = 0; x < xLen; x++) {
        this.grid.put(
          this.getKey(x * this.cellSize, y * this.cellSize),
          new HashSet()
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

  HashSet<ChainableParticle> addItem(ChainableParticle item) {
    String ky = this.getKey((int)item.x, (int)item.y);
    if (this.grid.get(ky) == null) {
      HashSet<ChainableParticle> cell = new HashSet();
      cell.add(item);
      this.grid.put(ky, cell);
      return cell;
    }
    // （これコピーして返さんで大丈夫かなぁ。。。）
    HashSet<ChainableParticle> cell = this.grid.get(ky);
    cell.add(item);
    return cell;
  }

  void removeItem(ChainableParticle item) {
    String ky = this.getKey((int)item.x, (int)item.y);
    if (this.grid.get(ky) == null) return;
    this.grid.get(ky).remove(item);
  }

  HashSet<ChainableParticle> query(int x, int y, int radius) {
    int xi0 = this.getIndex(x - radius) - 1;
    int xi1 = this.getIndex(x + radius) + 1;
    int yi0 = this.getIndex(y - radius) - 1;
    int yi1 = this.getIndex(y + radius) + 1;
    HashSet<ChainableParticle> result = new HashSet();
    String ky;
    for (int xi = xi0; xi <= xi1; xi++) {
      for (int yi = yi0; yi <= yi1; yi++) {
        ky = this._getKeyByIndices(xi, yi);
        if (this.grid.get(ky) != null) {
          //this.grid.get(ky).forEach(result.add, result);
          HashSet<ChainableParticle> v = this.grid.get(ky);
          for (ChainableParticle p : v) {
            result.add(p);
          }
        }
      }
    }
    return result;
  }

  HashGridClient createClient(ChainableParticle item) {
    return new HashGridClient(this, item);
  }
}

class HashGridClient {
  HashGrid hashGrid;
  ChainableParticle item;
  int indexX, indexY;
  HashSet<ChainableParticle> cell;
  HashGridClient(HashGrid hashGrid, ChainableParticle item) {
    this.hashGrid = hashGrid;
    this.item = item;
    this.indexX = this.hashGrid.getIndex((int)item.x);
    this.indexY = this.hashGrid.getIndex((int)item.y);
    this.cell = this.hashGrid.addItem(item);
  }

  void update() {
    int newIndexX = this.hashGrid.getIndex((int)this.item.x);
    int newIndexY = this.hashGrid.getIndex((int)this.item.x);
    if (newIndexX == this.indexX && newIndexY == this.indexY) return;

    this.cell.remove(this.item);
    this.cell = this.hashGrid.addItem(this.item);
    this.indexX = newIndexX;
    this.indexY = newIndexY;
  }

  void delete() {
    this.cell.remove(this.item);
  }
}
