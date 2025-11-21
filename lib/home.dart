import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:google_fonts/google_fonts.dart';

import 'place_radio.dart';
import 'music_checkbox.dart';

class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  DateTime _selectedDay = DateTime.now();

  String mood = "Happy";
  String place = "Indoor";
  bool music = false;

  String message = "";
  bool showMessage = false;

  List<String> goals = [];
  String goalInput = "";

  // Build final long motivational message
  void buildMessage() {
    String base = "";

    switch (mood) {
      case "Happy":
        base =
        "You’re glowing today! 🌞✨ Your positive energy can brighten any room. Keep spreading your kindness and joy wherever you go — the world needs more of your light! 💛⭐";
        break;

      case "Sad":
        base =
        "It’s okay to feel sad sometimes 💜😔. Your feelings are valid and it’s completely normal to have low days. Be gentle with yourself and give your heart a little rest. Better days are coming, and you are stronger than you think 🌈✨.";
        break;

      case "Stressed":
        base =
        "Take a deep breath… inhale calm, exhale worry 💫😮‍💨. You’re carrying a lot, but you’re doing the best you can — and that’s enough. Try to pause, reset, and give yourself a moment of peace. You’ve got this, truly 🌿💛.";
        break;

      case "Bored":
        base =
        "A spark of creativity might be all you need today ✨🎨. Try something new, fun, or unexpected! A small adventure, a new hobby, or even a cozy moment with music can change your mood completely. Let today surprise you! 🌟💡";
        break;

      case "Tired":
        base =
        "You’ve been doing so much, and your body and mind are asking for a little rest 😴💗. Slow down, breathe, and allow yourself to recharge. You deserve softness, comfort, and time to restore your beautiful energy 🌙💤✨.";
        break;
    }

    String placeMsg = place == "Indoor"
        ? " Enjoy your peaceful indoor time 🏡🕯️."
        : " Stepping outside for a bit might refresh your mind 🌿🌤️.";

    String musicMsg =
    music ? " Add some music and let it soothe your soul 🎶💖." : "";

    message = base + placeMsg + musicMsg;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(


      appBar: AppBar(
        backgroundColor: const Color(0xFFEAD8FF),
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Daily Mood Companion",
          style: GoogleFonts.poppins(
            fontSize: 22,
            fontWeight: FontWeight.w700,
            color: Colors.deepPurple,
          ),
        ),
      ),


      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepPurple,
        child: const Icon(Icons.message_rounded, color: Colors.white),
        onPressed: () {
          setState(() {
            showMessage = true;
            buildMessage();
          });
        },
      ),


      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFF3E8FF), Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),

        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 12),

                // CUTE DIVIDER
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 1.2,
                          indent: 30,
                          endIndent: 10,
                          color: Colors.deepPurple.shade200,
                        ),
                      ),
                      const Icon(Icons.favorite_rounded,
                          color: Colors.deepPurple, size: 18),
                      Expanded(
                        child: Divider(
                          thickness: 1.2,
                          indent: 10,
                          endIndent: 30,
                          color: Colors.deepPurple.shade200,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),


                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  padding: const EdgeInsets.all(18),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.deepPurple.withOpacity(0.1),
                        blurRadius: 12,
                      ),
                    ],
                  ),
                  child: TableCalendar(
                    focusedDay: _selectedDay,
                    firstDay: DateTime.utc(2020, 1, 1),
                    lastDay: DateTime.utc(2030, 12, 31),
                    selectedDayPredicate: (day) => isSameDay(day, _selectedDay),
                    onDaySelected: (day, _) {
                      setState(() => _selectedDay = day);
                    },
                    headerStyle: const HeaderStyle(
                      formatButtonVisible: false,
                      titleCentered: true,
                    ),
                  ),
                ),

                const SizedBox(height: 25),


                Container(
                  width: 280,
                  padding: const EdgeInsets.all(22),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.deepPurple.withOpacity(0.1),
                        blurRadius: 12,
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.mood_rounded,
                              color: Colors.deepPurple),
                          const SizedBox(width: 8),
                          Text(
                            "Select Your Mood",
                            style: GoogleFonts.poppins(
                                fontSize: 18,
                                color: Colors.deepPurple,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),

                      DropdownButton<String>(
                        value: mood,
                        isExpanded: true,
                        underline: Container(),
                        items: const [
                          DropdownMenuItem(value: "Happy", child: Text("Happy")),
                          DropdownMenuItem(value: "Sad", child: Text("Sad")),
                          DropdownMenuItem(
                              value: "Stressed", child: Text("Stressed")),
                          DropdownMenuItem(value: "Bored", child: Text("Bored")),
                          DropdownMenuItem(value: "Tired", child: Text("Tired")),
                        ],
                        onChanged: (value) {
                          setState(() {
                            mood = value!;
                          });
                        },
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 25),


                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Row(
                    children: [
                      const Icon(Icons.place_rounded,
                          color: Colors.deepPurple),
                      const SizedBox(width: 8),
                      Text(
                        "Choose Place",
                        style: GoogleFonts.poppins(
                          color: Colors.deepPurple,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),

                PlaceRadioWidget(updatePlace: (value) {
                  setState(() => place = value);
                }),

                const SizedBox(height: 20),


                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Row(
                    children: [
                      const Icon(Icons.music_note_rounded,
                          color: Colors.deepPurple),
                      const SizedBox(width: 8),
                      Text(
                        "Add Music",
                        style: GoogleFonts.poppins(
                          color: Colors.deepPurple,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),

                MusicCheckboxWidget(updateMusic: (value) {
                  setState(() => music = value);
                }),

                const SizedBox(height: 20),


                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          onChanged: (value) {
                            setState(() => goalInput = value);
                          },
                          decoration: InputDecoration(
                            hintText: "Add a goal...",
                            prefixIcon: const Icon(Icons.star_rounded,
                                color: Colors.deepPurple),
                            filled: true,
                            fillColor: Colors.white,
                            hintStyle: GoogleFonts.poppins(
                                color: Colors.deepPurple.shade200),
                            contentPadding: const EdgeInsets.all(15),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      GestureDetector(
                        onTap: () {
                          if (goalInput.trim().isNotEmpty) {
                            setState(() {
                              goals.add(goalInput.trim());
                              goalInput = "";
                            });
                          }
                        },
                        child: Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Colors.deepPurple,
                            borderRadius: BorderRadius.circular(18),
                          ),
                          child: const Icon(Icons.add_rounded, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),


                if (showMessage)
                  AnimatedOpacity(
                    opacity: 1,
                    duration: const Duration(milliseconds: 600),
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 25),
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.purple.shade100,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Text(
                        message,
                        style: GoogleFonts.poppins(
                          fontSize: 17,
                          color: Colors.deepPurple.shade700,
                          fontWeight: FontWeight.w600,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),


                if (goals.isNotEmpty)
                  AnimatedOpacity(
                    opacity: 1,
                    duration: const Duration(milliseconds: 600),
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 25, vertical: 10),
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(22),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.deepPurple.withOpacity(0.15),
                            blurRadius: 12,
                          ),
                        ],
                      ),

                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          // Title with Date & Icon
                          Row(
                            children: [
                              const Icon(Icons.list_alt_rounded,
                                  color: Colors.deepPurple),
                              const SizedBox(width: 8),
                              Text(
                                "Today's Goals – ${_selectedDay.day}/${_selectedDay.month}/${_selectedDay.year}",
                                style: GoogleFonts.poppins(
                                  fontSize: 18,
                                  color: Colors.deepPurple,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 10),

                          // List of goals
                          ...goals.map(
                                (goal) => Container(
                              margin: const EdgeInsets.only(bottom: 10),
                              padding: const EdgeInsets.all(14),
                              decoration: BoxDecoration(
                                color: Colors.deepPurple.shade50,
                                borderRadius: BorderRadius.circular(18),
                              ),
                              child: Row(
                                children: [
                                  const Icon(
                                    Icons.check_circle_outline_rounded,
                                    color: Colors.deepPurple,
                                    size: 20,
                                  ),
                                  const SizedBox(width: 10),
                                  Expanded(
                                    child: Text(
                                      goal,
                                      style: GoogleFonts.poppins(
                                        fontSize: 15,
                                        color: Colors.deepPurple.shade700,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                const SizedBox(height: 50),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

