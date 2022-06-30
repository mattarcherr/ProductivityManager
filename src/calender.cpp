#include "mainwindow.h"
#include "ui_mainwindow.h"
#include <iostream>

int MainWindow::getDate()
{
    time_t now = time(0);
    tm local_tm = *localtime(&now);
    systemMonth = local_tm.tm_mon;
    systemDay = local_tm.tm_mday;
    systemWeekday = local_tm.tm_wday;
    selectedMonth = systemMonth;
    return 1;
}

std::map<int , QString> getDayMap(int day, int weekDay)
{
    std::map<int , QString> dayMap;
    // calculates difference between current date and first of the month
    while (day > 7){
        day =-7;
    }
    day --;
    // finds week day for first of the month
    weekDay = weekDay-day;
   // sets dayMap depending on first of the month week day
    if (weekDay == 0){
    std::map<int , QString> dayMap {
        {1 , "MONDAY" },
        {2 , "TUESDAY" },
        {3 , "WEDNESDAY" },
        {4 , "THURSDAY" },
        {5 , "FRIDAY" },
        {6 , "SATURDAY" },
        {0 , "SUNDAY" },
    };  return dayMap; }
    else if (weekDay == 1) {
    std::map<int , QString> dayMap {
        {2 , "MONDAY" },
        {3 , "TUESDAY" },
        {4 , "WEDNESDAY" },
        {5 , "THURSDAY" },
        {6 , "FRIDAY" },
        {0 , "SATURDAY" },
        {1 , "SUNDAY" },
    };  return dayMap; }
    else if (weekDay == 2){
    std::map<int , QString> dayMap {
        {3 , "MONDAY" },
        {4, "TUESDAY" },
        {5 , "WEDNESDAY" },
        {6 , "THURSDAY" },
        {0 , "FRIDAY" },
        {1 , "SATURDAY" },
        {2 , "SUNDAY" },
    };  return dayMap; }
    else if (weekDay == 3){
    std::map<int , QString> dayMap {
        {4 , "MONDAY" },
        {5 , "TUESDAY" },
        {6 , "WEDNESDAY" },
        {0 , "THURSDAY" },
        {1 , "FRIDAY" },
        {2 , "SATURDAY" },
        {3 , "SUNDAY" },
    };  return dayMap; }
    else if (weekDay == 4){
    std::map<int , QString> dayMap {
        {5 , "MONDAY" },
        {6 , "TUESDAY" },
        {0 , "WEDNESDAY" },
        {1 , "THURSDAY" },
        {2 , "FRIDAY" },
        {3 , "SATURDAY" },
        {4 , "SUNDAY" },
    };  return dayMap; }
    else if (weekDay == 5){
    std::map<int , QString> dayMap {
        {6 , "MONDAY" },
        {0 , "TUESDAY" },
        {1 , "WEDNESDAY" },
        {2 , "THURSDAY" },
        {3 , "FRIDAY" },
        {4 , "SATURDAY" },
        {5 , "SUNDAY" },
    };  return dayMap; }
    else if (weekDay == 6){
    std::map<int , QString> dayMap {
        {0 , "MONDAY" },
        {1 , "TUESDAY" },
        {2 , "WEDNESDAY" },
        {3 , "THURSDAY" },
        {4 , "FRIDAY" },
        {5 , "SATURDAY" },
        {6 , "SUNDAY" },
    }; return dayMap; }
    return dayMap;
}

int MainWindow::fillCalender()
{

    std::map<int, QString> dayMap = getDayMap(systemDay, systemWeekday);

    QString month;
    switch (selectedMonth) {
    case 0: month = "JAN"; break;
    case 1: month = "FEB"; break;
    case 2: month = "MAR"; break;
    case 3: month = "APR"; break;
    case 4: month = "MAY"; break;
    case 5: month = "JUN"; break;
    case 6: month = "JUL"; break;
    case 7: month = "AUG"; break;
    case 8: month = "SEP"; break;
    case 9: month = "OCT"; break;
    case 10: month = "NOV"; break;
    case 11: month = "DEC"; break;
    }

    // Fill text for all day buttons
    ui->day1w1->setText((dayMap[0]+"\n"+month+" 01"));
    ui->day2w1->setText((dayMap[1]+"\n"+month+" 02"));
    ui->day3w1->setText((dayMap[2]+"\n"+month+" 03"));
    ui->day4w1->setText((dayMap[3]+"\n"+month+" 04"));
    ui->day5w1->setText((dayMap[4]+"\n"+month+" 05"));
    ui->day6w1->setText((dayMap[5]+"\n"+month+" 06"));
    ui->day7w1->setText((dayMap[6]+"\n"+month+" 07"));

    ui->day1w2->setText((dayMap[0]+"\n"+month+" 08"));
    ui->day2w2->setText((dayMap[1]+"\n"+month+" 09"));
    ui->day3w2->setText((dayMap[2]+"\n"+month+" 10"));
    ui->day4w2->setText((dayMap[3]+"\n"+month+" 11"));
    ui->day5w2->setText((dayMap[4]+"\n"+month+" 12"));
    ui->day6w2->setText((dayMap[5]+"\n"+month+" 13"));
    ui->day7w2->setText((dayMap[6]+"\n"+month+" 14"));

    ui->day1w3->setText((dayMap[0]+"\n"+month+" 15"));
    ui->day2w3->setText((dayMap[1]+"\n"+month+" 16"));
    ui->day3w3->setText((dayMap[2]+"\n"+month+" 17"));
    ui->day4w3->setText((dayMap[3]+"\n"+month+" 18"));
    ui->day5w3->setText((dayMap[4]+"\n"+month+" 19"));
    ui->day6w3->setText((dayMap[5]+"\n"+month+" 20"));
    ui->day7w3->setText((dayMap[6]+"\n"+month+" 21"));

    ui->day1w4->setText((dayMap[0]+"\n"+month+" 22"));
    ui->day2w4->setText((dayMap[1]+"\n"+month+" 23"));
    ui->day3w4->setText((dayMap[2]+"\n"+month+" 24"));
    ui->day4w4->setText((dayMap[3]+"\n"+month+" 25"));
    ui->day5w4->setText((dayMap[4]+"\n"+month+" 26"));
    ui->day6w4->setText((dayMap[5]+"\n"+month+" 27"));
    ui->day7w4->setText((dayMap[6]+"\n"+month+" 28"));

    // feburary ( leap year still needed )
    if (month == "FEB"){
        ui->day1w5->setText((""));
        ui->day2w5->setText((""));
    }
    else {
        ui->day1w5->setText((dayMap[0]+"\n"+month+" 29"));
        ui->day2w5->setText((dayMap[1]+"\n"+month+" 30"));
    }

    // fill text for 31st if needed and fill remaining squares
//    std::string longMonths[7] = {"JAN","MAR","MAY","JUL","AUG","OCT","DEC"};
    if (month == "JAN" || month == "MAR" || month == "MAY" || month == "JUL" || month == "AUG" || month == "OCT" || month == "DEC") {
        ui->day3w5->setText((dayMap[2]+"\n"+month+" 31"));
    }
    else {
        ui->day3w5->setText((""));
        ui->day3w5->setEnabled(0);
    }
    ui->day4w5->setText((""));
    ui->day5w5->setText((""));
    ui->day6w5->setText((""));
    ui->day7w5->setText((""));

    // Highlight current day
    switch (systemDay){
    case 1: ui->day1w1->setStyleSheet("background-color: grey"); break;
    case 2: ui->day2w1->setStyleSheet("background-color: grey"); break;
    case 3: ui->day3w1->setStyleSheet("background-color: grey"); break;
    case 4: ui->day4w1->setStyleSheet("background-color: grey"); break;
    case 5: ui->day5w1->setStyleSheet("background-color: grey"); break;
    case 6: ui->day6w1->setStyleSheet("background-color: grey"); break;
    case 7: ui->day7w1->setStyleSheet("background-color: grey"); break;
    case 8: ui->day1w2->setStyleSheet("background-color: grey"); break;
    case 9: ui->day2w2->setStyleSheet("background-color: grey"); break;
    case 10: ui->day3w2->setStyleSheet("background-color: grey"); break;
    case 11: ui->day4w2->setStyleSheet("background-color: grey"); break;
    case 12: ui->day5w2->setStyleSheet("background-color: grey"); break;
    case 13: ui->day6w2->setStyleSheet("background-color: grey"); break;
    case 14: ui->day7w2->setStyleSheet("background-color: grey"); break;
    case 15: ui->day1w3->setStyleSheet("background-color: grey"); break;
    case 16: ui->day2w3->setStyleSheet("background-color: grey"); break;
    case 17: ui->day3w3->setStyleSheet("background-color: grey"); break;
    case 18: ui->day4w3->setStyleSheet("background-color: grey"); break;
    case 19: ui->day5w3->setStyleSheet("background-color: grey"); break;
    case 20: ui->day6w3->setStyleSheet("background-color: grey"); break;
    case 21: ui->day7w3->setStyleSheet("background-color: grey"); break;
    case 22: ui->day1w4->setStyleSheet("background-color: grey"); break;
    case 23: ui->day2w4->setStyleSheet("background-color: grey"); break;
    case 24: ui->day3w4->setStyleSheet("background-color: grey"); break;
    case 25: ui->day4w4->setStyleSheet("background-color: grey"); break;
    case 26: ui->day5w4->setStyleSheet("background-color: grey"); break;
    case 27: ui->day6w4->setStyleSheet("background-color: grey"); break;
    case 28: ui->day7w4->setStyleSheet("background-color: grey"); break;
    case 29: ui->day1w5->setStyleSheet("background-color: grey"); break;
    case 30: ui->day2w5->setStyleSheet("background-color: grey"); break;
    case 31: ui->day3w5->setStyleSheet("background-color: grey"); break;
    }

    // Disable all buttons past last day in month
    ui->day4w5->setEnabled(0);
    ui->day5w5->setEnabled(0);
    ui->day6w5->setEnabled(0);
    ui->day7w5->setEnabled(0);
    return 1;
}
