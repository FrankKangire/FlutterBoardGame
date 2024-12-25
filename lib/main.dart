import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // Add this package for state management.

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => GameState(),
      child: MyApp(),
    ),
  );
}

class GameState extends ChangeNotifier {
  // Positions for multiple players
  Map<String, Offset> playerPositions = {
    "player1": Offset(24.0, 555.0),
    "player2": Offset(24.0, 555.0),
    "player3": Offset(24.0, 555.0),
    "player4": Offset(24.0, 555.0),
  };

  void updatePosition(String player, Offset newPosition) {
    playerPositions[player] = newPosition;
    notifyListeners(); // Notify listeners to rebuild.
  }

  Offset getPosition(String player) {
    return playerPositions[player]!;
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  int diceRoll = 1;

  void movePlayer(BuildContext context, String player, int steps) {
    final gameState = Provider.of<GameState>(context, listen: false);

    // Calculate the new position (example for a board)
    Offset currentPos = gameState.getPosition(player);
    double xPos = currentPos.dx;
    double yPos = currentPos.dy;

    if (steps == 1) {
      xPos = 98.0;
      yPos = 555.0;
    } else if (steps == 2) {
      xPos = 151.0;
      yPos = 555.0;
    }
    if (steps == 3) {
      setState(() {
        xPos = 202.0;
        yPos = 555.0;
      });
    }
    if (steps == 4) {
      setState(() {
        xPos = 253.0;
        yPos = 555.0;
      });
    }
    if (steps == 5) {
      setState(() {
        xPos = 304.0;
        yPos = 555.0;
      });
    }
    if (steps == 6) {
      setState(() {
        xPos = 380.0;
        yPos = 555.0;
      });
    }
    if (steps == 7) {
      setState(() {
        xPos = 380.0;
        yPos = 480.0;
      });
    }
    if (steps == 8) {
      setState(() {
        xPos = 380.0;
        yPos = 429.0;
      });
    }
    if (steps == 9) {
      setState(() {
        xPos = 380.0;
        yPos = 378.0;
      });
    }
    if (steps == 10) {
      setState(() {
        xPos = 380.0;
        yPos = 326.0;
      });
    }
    if (steps == 11) {
      setState(() {
        xPos = 380.0;
        yPos = 275.0;
      });
    }
    if (steps == 12) {
      setState(() {
        xPos = 380.0;
        yPos = 195.0;
      });
    }
    if (steps == 13) {
      setState(() {
        xPos = 304.0;
        yPos = 195.0;
      });
    }
    if (steps == 14) {
      setState(() {
        xPos = 253.0;
        yPos = 195.0;
      });
    }
    if (steps == 15) {
      setState(() {
        xPos = 202.0;
        yPos = 195.0;
      });
    }
    if (steps == 16) {
      setState(() {
        xPos = 151.0;
        yPos = 195.0;
      });
    }
    if (steps == 17) {
      setState(() {
        xPos = 98.0;
        yPos = 195.0;
      });
    }
    if (steps == 18) {
      setState(() {
        xPos = 24.0;
        yPos = 195.0;
      });
    }
    if (steps == 19) {
      setState(() {
        xPos = 24.0;
        yPos = 275.0;
      });
    }
    if (steps == 20) {
      setState(() {
        xPos = 24.0;
        yPos = 326.0;
      });
    }
    if (steps == 21) {
      setState(() {
        xPos = 24.0;
        yPos = 378.0;
      });
    }
    if (steps == 22) {
      setState(() {
        xPos = 24.0;
        yPos = 429.0;
      });
    }
    if (steps == 23) {
      setState(() {
        xPos = 24.0;
        yPos = 480.0;
      });
    }
    if (steps == 24) {
      setState(() {
        xPos = 98.0;
        yPos = 480.0;
      });
    }
    if (steps == 25) {
      setState(() {
        xPos = 155.0;
        yPos = 490.0;
      });
    }
    if (steps == 26) {
      setState(() {
        xPos = 202.0;
        yPos = 480.0;
      });
    }
    if (steps == 27) {
      setState(() {
        xPos = 248.0;
        yPos = 485.0;
      });
    }
    if (steps == 28) {
      setState(() {
        xPos = 308.0;
        yPos = 330.0;
      });
    }
    if (steps == 29) {
      setState(() {
        xPos = 303.0;
        yPos = 270.0;
      });
    }
    if (steps == 30) {
      setState(() {
        xPos = 250.0;
        yPos = 265.0;
      });
    }
    if (steps == 31) {
      setState(() {
        xPos = 202.0;
        yPos = 265.0;
      });
    }
    if (steps == 32) {
      setState(() {
        xPos = 151.0;
        yPos = 265.0;
      });
    }
    if (steps == 33) {
      setState(() {
        xPos = 93.0;
        yPos = 422.0;
      });
    }

    gameState.updatePosition(player, Offset(xPos, yPos));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Jungle Professor"),
          backgroundColor: Colors.green,
        ),
        body: Center(
          child: Stack(
            children: [
              // Background Board
              Container(
                alignment: Alignment.center,
                child: const Image(
                  image: AssetImage("images/IMG-20240301-WA0006.jpg"),
                ),
              ),

              // Player Pieces
              Consumer<GameState>(
                builder: (context, gameState, child) {
                  return Stack(
                    children: gameState.playerPositions.entries.map((entry) {
                      return AnimatedPositioned(
                        duration: const Duration(milliseconds: 500),
                        left: entry.value.dx,
                        top: entry.value.dy,
                        child: CircleAvatar(
                          radius: 22,
                          backgroundColor: _getPlayerColor(entry.key),
                        ),
                      );
                    }).toList(),
                  );
                },
              ),

              // Roll Dice Button
              Align(
                alignment: Alignment.bottomCenter,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.green),
                  ),
                  onPressed: () {
                    movePlayer(context, "player1", diceRoll);
                    diceRoll = diceRoll + 1; // Simulate dice roll increment.
                  },
                  child: const Text("Roll Dice"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper method to assign colors to players
  Color _getPlayerColor(String player) {
    switch (player) {
      case "player1":
        return Colors.blue;
      case "player2":
        return Colors.red;
      case "player3":
        return Colors.green;
      case "player4":
        return Colors.yellow;
      default:
        return Colors.grey;
    }
  }
}
