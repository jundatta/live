// こちらがオリジナルです。
// 【作者】Richard Bourneさん
// 【作品名】Calendar
// https://openprocessing.org/sketch/1828029

import java.util.Date;

/* @pjs font="ArialMT-48"; */

String[] monthNames = {"January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"};
int[]    monthDays  = {31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31        };

String[] weekDays = {"Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"};

ArrayList<MonthDay> holidays;

int currentMonth;
int currentYear;

float plannerWidth = 0;

float margin = 50;
float topLabelMargin = 100;
float calendarWidth = width - plannerWidth - (margin * 2);
float calendarHeight = height - (margin * 2) - topLabelMargin;
float spacing = 5;

void setup() {
  size(888, 666);
  smooth();

  //textFont(createFont("ArialMT-48", 12));
  textAlign(CENTER, CENTER);

  holidays = new ArrayList<MonthDay>();
  holidays.add(new Holiday("00:00\nStudio", 4, 28));
  holidays.add(new Holiday("New Year's Day", 1, 1));
  holidays.add(new Holiday("Independence\nDay", 7, 4));
  holidays.add(new Holiday("Halloween", 10, 31));
  holidays.add(new Holiday("Veterans' Day", 11, 11));
  holidays.add(new Holiday("Christmas", 12, 25));
  holidays.add(new MonthDay() {
    public String getName() {
      return "Martin Luther\nKing Jr. Day";
    }
    public int getMonth() {
      return 1;
    }
    public int getDay() {
      return getDayInMonth(currentYear, currentMonth, 2, 3);
    }
  }
  );
  holidays.add(new MonthDay() {
    public String getName() {
      return "Presidents' Day";
    }
    public int getMonth() {
      return 2;
    }
    public int getDay() {
      return getDayInMonth(currentYear, currentMonth, 2, 3);
    }
  }
  );
  holidays.add(new MonthDay() {
    public String getName() {
      return "Mothers' Day";
    }
    public int getMonth() {
      return 5;
    }
    public int getDay() {
      return getDayInMonth(currentYear, currentMonth, 1, 2);
    }
  }
  );
  holidays.add(new MonthDay() {
    public String getName() {
      return "Fathers' Day";
    }
    public int getMonth() {
      return 6;
    }
    public int getDay() {
      return getDayInMonth(currentYear, currentMonth, 1, 3);
    }
  }
  );
  holidays.add(new MonthDay() {
    public String getName() {
      return "Memorial Day";
    }
    public int getMonth() {
      return 5;
    }
    public int getDay() {
      return lastDayInMonth(currentYear, currentMonth, 2);
    }
  }
  );
  holidays.add(new MonthDay() {
    public String getName() {
      return "Labor Day";
    }
    public int getMonth() {
      return 9;
    }
    public int getDay() {
      return getDayInMonth(currentYear, currentMonth, 2, 1);
    }
  }
  );
  holidays.add(new MonthDay() {
    public String getName() {
      return "Columbus Day";
    }
    public int getMonth() {
      return 10;
    }
    public int getDay() {
      return getDayInMonth(currentYear, currentMonth, 2, 2);
    }
  }
  );
  holidays.add(new MonthDay() {
    public String getName() {
      return "Thanksgiving";
    }
    public int getMonth() {
      return 11;
    }
    public int getDay() {
      return getDayInMonth(currentYear, currentMonth, 5, 4);
    }
  }
  );

  currentMonth = month() - 1;
  currentYear = year();
}

void draw() {
  //Date Metrics
  String monthName = monthNames[currentMonth];
  int daysInMonth = int(monthDays[currentMonth]);
  if (currentMonth == 1 && isLeapYear(currentYear)) daysInMonth ++;
  int dayOfMonth = -1;

  if (currentMonth == month() - 1 && currentYear == year()) {
    dayOfMonth = day();
  }

  var date = new Date();
  date.setYear(currentYear);
  date.setMonth(currentMonth);
  date.setDate(1);

  int startingDayOfMonth = date.getDay(); //int(7 - (dayOfMonth % 7)); //NOT WORKING!

  //Calendar Metrics
  int numRows = ceil((startingDayOfMonth + daysInMonth) / 7.0f);
  margin = 50;
  topLabelMargin = 100;
  calendarWidth = width - plannerWidth - (margin * 2);
  calendarHeight = height - (margin * 2) - topLabelMargin;
  spacing = 5;
  float boxWidth = (calendarWidth - (6 * spacing)) / 7.0f;
  float boxHeight = (calendarHeight - ((numRows - 1) * spacing)) / (float)numRows;

  background(102, 102, 140);

  if (mouseInArrowRange()) {
    noStroke();

    if (mouseOverArrow(-1) || mouseOverArrow(-2)) fill(255);
    else fill(204);
    triangle((width - plannerWidth) / 2.0f - (width - plannerWidth) / 10.0f * 3.5, margin + topLabelMargin / 10.0f * 3, (width - plannerWidth) / 2.0f - (width - plannerWidth) / 10.0f * 3, margin + topLabelMargin / 10.0f * 2, (width - plannerWidth) / 2.0f - (width - plannerWidth) / 10.0f * 3, margin + topLabelMargin / 10.0f * 4);

    if (mouseOverArrow(1) || mouseOverArrow(2)) fill(255);
    else fill(204);
    triangle((width - plannerWidth) / 2.0f + (width - plannerWidth) / 10.0f * 3.5, margin + topLabelMargin / 10.0f * 3, (width - plannerWidth) / 2.0f + (width - plannerWidth) / 10.0f * 3, margin + topLabelMargin / 10.0f * 2, (width - plannerWidth) / 2.0f + (width - plannerWidth) / 10.0f * 3, margin + topLabelMargin / 10.0f * 4);

    if (mouseOverArrow(-2)) fill(255);
    else fill(204);
    triangle((width - plannerWidth) / 2.0f - (width - plannerWidth) / 10.0f * 4.1, margin + topLabelMargin / 10.0f * 3, (width - plannerWidth) / 2.0f - (width - plannerWidth) / 10.0f * 3.6, margin + topLabelMargin / 10.0f * 2, (width - plannerWidth) / 2.0f - (width - plannerWidth) / 10.0f * 3.6, margin + topLabelMargin / 10.0f * 4);

    if (mouseOverArrow(2)) fill(255);
    else fill(204);
    triangle((width - plannerWidth) / 2.0f + (width - plannerWidth) / 10.0f * 4.1, margin + topLabelMargin / 10.0f * 3, (width - plannerWidth) / 2.0f + (width - plannerWidth) / 10.0f * 3.6, margin + topLabelMargin / 10.0f * 2, (width - plannerWidth) / 2.0f + (width - plannerWidth) / 10.0f * 3.6, margin + topLabelMargin / 10.0f * 4);
  }

  fill(255);
  stroke(204);
  textSize(42);

  text(monthName + " " + currentYear, (width - plannerWidth) / 2, margin + topLabelMargin / 10 * 3);

  fill(204);
  textSize(16);

  for (int i = 0; i < weekDays.length; i ++)
    text(weekDays[i], margin + (spacing * i) + (boxWidth * i) + boxWidth / 2.0f, margin + topLabelMargin / 10.0f * 7);

  line(margin, margin + topLabelMargin / 10.0f * 8.5, width - plannerWidth - margin, margin + topLabelMargin / 10.0f * 8.5);

  stroke(0);

  float xoff = startingDayOfMonth;
  float yoff = 0;
  for (int i = 0; i < daysInMonth; i ++) {
    float x = margin + (spacing * xoff) + (boxWidth * xoff);
    float y = margin + topLabelMargin + (spacing * yoff) + (boxHeight * yoff);

    noStroke();
    fill(51);

    rect(x + 3, y + 3, boxWidth, boxHeight);

    stroke(0);
    if ((i + 1) == dayOfMonth) fill(255);
    else fill(204);

    rect(x, y, boxWidth, boxHeight);

    fill(0);
    textSize(24);

    text(i + 1, x + boxWidth / 2.0f, y + boxHeight / 2.0f);

    textSize(9);

    float yH = 0;
    for (MonthDay holiday : holidays) {
      if (currentMonth + 1 == holiday.getMonth() && i + 1 == holiday.getDay()) {
        text(holiday.getName(), x + boxWidth / 2.0f, y + boxHeight / 20.0f * 17 - (textAscent() + textAscent()) * yH);
        yH ++;
      }
    }

    xoff = (xoff + 1) % 7;
    if (xoff == 0) yoff ++;
  }

  if (!isToday()) {
    if (overTodayButton()) fill(255);
    else fill(204);
    textSize(12);

    text("Today", (width - plannerWidth) / 2.0f, height - margin / 2.0f);

    if (mousePressed && overTodayButton()) goToToday();
  }

  noStroke();

  if (plannerWidth > 50) {
    fill(51);

    rect(width - plannerWidth + 3, margin + topLabelMargin + 3, plannerWidth - margin, height - margin * 2 - topLabelMargin);

    stroke(0);
    fill(204);

    rect(width - plannerWidth, margin + topLabelMargin, plannerWidth - margin, height - margin * 2 - topLabelMargin);
  }
}

boolean mouseOverArrow(int arrow) {
  switch(arrow) {
  case -2:
    return (mouseInArrowRange() && mouseX > ((width - plannerWidth) / 2.0f - (width - plannerWidth) / 10.0f * 4.1) && (mouseX < (width - plannerWidth) / 2.0f - (width - plannerWidth) / 10.0f * 3.6));
  case -1:
    return (mouseInArrowRange() && mouseX > ((width - plannerWidth) / 2.0f - (width - plannerWidth) / 10.0f * 3.5) && (mouseX < (width - plannerWidth) / 2.0f - (width - plannerWidth) / 10.0f * 3));
  case 1:
    return (mouseInArrowRange() && mouseX < ((width - plannerWidth) / 2.0f + (width - plannerWidth) / 10.0f * 3.5) && (mouseX > (width - plannerWidth) / 2.0f + (width - plannerWidth) / 10.0f * 3));
  case 2:
    return (mouseInArrowRange() && mouseX < ((width - plannerWidth) / 2.0f + (width - plannerWidth) / 10.0f * 4.1) && (mouseX > (width - plannerWidth) / 2.0f + (width - plannerWidth) / 10.0f * 3.6));
  }

  return false;
}

boolean mouseInArrowRange() {
  return (mouseY > (margin + topLabelMargin / 10.0f * 2) && mouseY < (margin + topLabelMargin / 10.0f * 4));
}

boolean isLeapYear(int year) {
  if (year % 400 == 0) return true;
  else if (year % 100 == 0) return false;
  else if (year % 4 == 0) return true;
  else return false;
}

void mousePressed() {
  if (mouseInArrowRange()) {
    if (mouseOverArrow(-2)) currentYear --;
    if (mouseOverArrow(-1)) {
      currentMonth --;
      if (currentMonth < 0) {
        currentYear --;
        currentMonth = 11;
      }
    }
    if (mouseOverArrow(1)) {
      currentMonth ++;
      if (currentMonth > 11) {
        currentYear ++;
        currentMonth = 0;
      }
    }
    if (mouseOverArrow(2)) currentYear ++;
  }
}

int getDayInMonth(int year, int month, int dayOfWeek, int num) {
  var date = new Date();
  date.setYear(year);
  date.setMonth(month);
  date.setDate(1);

  int startingDayOfMonth = date.getDay();

  return 7 * (dayOfWeek > startingDayOfMonth ? num - 1 : num) + (dayOfWeek) - startingDayOfMonth;
}

int lastDayInMonth(int year, int month, int dayOfWeek) {
  int daysInMonth = int(monthDays[month]);
  if (month == 1 && isLeapYear(year)) daysInMonth ++;

  var date = new Date();
  date.setYear(year);
  date.setMonth(month);
  date.setDate(daysInMonth);

  int lastDayOfMonth = date.getDay();

  return daysInMonth - (lastDayOfMonth - dayOfWeek) - (dayOfWeek - 1 > lastDayOfMonth ? 7 : 0) - 1;
}

void goToToday() {
  currentYear = year();
  currentMonth = month() - 1;
}

boolean isToday() {
  return (currentYear == year() && currentMonth == month() - 1);
}

boolean overTodayButton() {
  textSize(12);
  float textWidth = 60;
  float textHeight = textAscent() + textDescent() + 20;

  return (mouseX > (width - plannerWidth) / 2.0f - textWidth / 2.0f && mouseX < (width - plannerWidth) / 2.0f + textWidth / 2.0f && mouseY > height - margin / 2.0f - textHeight / 2.0f && mouseY < height - margin / 2.0f + textHeight / 2.0f);
}

boolean overPlannerScroller() {
  return (mouseY > margin + topLabelMargin && mouseY < margin + topLabelMargin + calendarHeight && mouseX > width - plannerWidth - 15 && mouseX < width - plannerWidth + 5);
}

class Holiday extends MonthDay {
  int month;
  int day;

  Holiday(String n, int m, int d) {
    name = n;
    month = m;
    day = d;
  }

  int getMonth() {
    return month;
  }

  int getDay() {
    return day;
  }
}

abstract class MonthDay {
  String name;

  MonthDay() {
  }

  public String getName() {
    return name;
  }

  abstract int getMonth();
  abstract int getDay();
}
