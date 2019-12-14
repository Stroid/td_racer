class Track {
  int x_pos; 
  int y_pos; 
  int game_width; 
  int game_height;

  private int[][] track = {
    {4, 0, 0, 5}, 
    {1, 4, 0, 2}, 
    {1, 3, 0, 5}, 
    {3, 0, 0, 2}, 
  };

  Chunk[] track_chunks;

  int track_rows;
  int track_cols;
  int chunk_size;
  color game_color = color(#0CAA1D);
  Track(int x_pos, int y_pos, int game_width, int game_height) {
    this.x_pos = x_pos;
    this.y_pos = y_pos;
    this.game_width = game_width;
    this.game_height = game_height;

    chunk_size = game_height/track.length;
    track_chunks = new Chunk[track.length * track[0].length];
    int chunk_id = 0;
    for (int row = 0; row < track.length; row++) {
      for (int col = 0; col < track.length; col++) {
        track_chunks[chunk_id] = new Chunk(col, row, chunk_size, track[row][col], chunk_id);
        chunk_id++;
      }
    }
    track_rows = track.length;
    track_cols = track[0].length;
  }


  Chunk get_chunk(float x, float y) {
    int row = (int)map(x, 0, game_height, 0, track_rows);
    int col = (int)map(y, 0, game_width, 0, track_cols);

    int ID = col * track_cols + row;
    for ( Chunk chunk : track_chunks) {
      if (chunk.ID == ID) {
        return chunk;
      }
    }
    return null;
  }


  int get_chunk_type(PVector pos) {
    //return the type of chunk at the given possition
    int x = (int) map(pos.x, 0, game_width, 0, track_cols);
    int y = (int) map(pos.y, 0, game_height, 0, track_rows);

    int chunk_mode;
    chunk_mode = track[y][x];

    return chunk_mode;
  }


  void display() {
    fill(game_color);
    rect(this.x_pos, this.y_pos, this.game_width, this.game_height);
    for (Chunk chunk : track_chunks) {
      chunk.display();
    }
  }
}
