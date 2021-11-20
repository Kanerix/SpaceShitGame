class Level {
  // Loader vores map fra en json fil fundet ved hjælp af parameteret path
  void load(String path) {
    // Kan fejle ved forkert path, eller forkert opsat fil
    try {
      JSONObject jsonObject = loadJSONObject(path);

      JSONObject spawnObject = jsonObject.getJSONObject("spawn");

      JSONObject playerSpawnObject = spawnObject.getJSONObject("player");
      // Sætter spiller skibbets pos til hvad der blev loaded fra filen
      game.ship.pos.set(playerSpawnObject.getInt("x"), playerSpawnObject.getInt("y"));

      JSONObject enemySpawnObject = spawnObject.getJSONObject("enemy");
      // Sætter fjende skibbets pos til hvad der blev loaded fra filen
      game.enemy.pos.set(enemySpawnObject.getInt("x"), enemySpawnObject.getInt("y"));

      JSONArray jsonObstaclesArray = jsonObject.getJSONArray("obstacles");
      Obstacle[] obstaclesArray = new Obstacle[jsonObstaclesArray.size()];

      // Laver alle vores hindringer og adder til et array
      for (int i = 0; i < jsonObstaclesArray.size(); i++) {
        JSONObject currentObstacle = jsonObstaclesArray.getJSONObject(i);

        JSONObject obstacleSize = currentObstacle.getJSONObject("size");
        JSONObject obstaclePos = currentObstacle.getJSONObject("pos");

        PVector obstacleSizeVector = new PVector(
          obstacleSize.getInt("width"),
          obstacleSize.getInt("height")
          );
        PVector obstaclePosVector = new PVector(
          obstaclePos.getInt("x"),
          obstaclePos.getInt("y")
          );

        obstaclesArray[i] = new Obstacle(obstaclePosVector, obstacleSizeVector, new PVector());
      }

      Obstacle[] emptyArray = {};
      
      // Putter vores hindringer ind i spillets obstacle array.
      game.obstacles = (Obstacle[]) concat(emptyArray, obstaclesArray);
    }
    catch(Exception error) {
      println(error);
    }
  }
}
