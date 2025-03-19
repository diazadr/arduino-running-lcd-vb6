#include <Wire.h>
#include <LiquidCrystal_I2C.h>

LiquidCrystal_I2C lcd(0x27, 16, 2); // Sesuaikan alamat I2C LCD

String receivedText = ""; // Menyimpan teks yang diterima
bool newData = false; // Flag untuk menandai ada data baru

void setup() {
  Serial.begin(9600);
 // Buat rate sesuai dengan VS
  lcd.init();
  lcd.backlight();
  lcd.clear();
  Serial.println("LCD Ready"); // Debugging untuk cek komunikasi serial
}

void loop() {
  if (Serial.available()) {
    char c = Serial.read();
    
    if (c == 12) { // Jika menerima karakter "clear screen" (Chr(12))
      lcd.clear();
      receivedText = "";
      Serial.println("LCD Cleared"); // Debugging
    } else {
      receivedText += c;
      newData = true; // Set flag bahwa ada data baru
    }
  }
  
  // Jika ada data baru, update tampilan LCD
  if (newData) {
    lcd.clear(); // Bersihkan LCD sebelum menulis teks baru
    lcd.setCursor(0, 0);
    
    if (receivedText.length() <= 16) {
      lcd.print(receivedText); // Tampilkan teks di baris pertama jika cukup
    } else {
      lcd.print(receivedText.substring(0, 16)); // Baris pertama
      lcd.setCursor(0, 1);
      lcd.print(receivedText.substring(16)); // Baris kedua
    }
    
    Serial.print("Displayed: ");
    Serial.println(receivedText); // Debugging untuk melihat teks yang dikirim
    
    newData = false; // Reset flag setelah update LCD
  }
  
  delay(200); // Tambahkan delay agar LCD tidak berkedip cepat
}