class Highscore {
  // Selve highscoren
  int highscore;
  // Highscore tablet
  Table highscoreData;

  Highscore() {
    try {
      this.loadHighscoreFile();
    }
    catch(Exception error) {
      this.generateHighscoreFile();
    }
  }

  // Generere en fil der indeholder highscore
  void generateHighscoreFile() {
    Table highscoreTable = new Table();
    highscoreTable.addColumn("highscore", Table.INT);

    TableRow highscoreRow = highscoreTable.addRow();
    highscoreRow.setInt("highscore", 0);

    this.highscoreData = highscoreTable;

    saveTable(highscoreTable, "./data/highscore.csv", "csv");
  }

  // Loader highscoren fra en fil.
  void loadHighscoreFile() {
    Table highscoreData = loadTable("./data/highscore.csv", "header");
    TableRow row = highscoreData.getRow(0);

    this.highscoreData = highscoreData;
    this.highscore = row.getInt("highscore");
  }

  // Gemmer highscoren i en fil.
  void saveHighscoreToFile() {
    Table highscoreData = this.highscoreData;

    TableRow row = highscoreData.getRow(0);
    row.setInt("highscore", this.highscore);
    
    saveTable(highscoreData, "./data/highscore.csv", "csv");
  }
}
