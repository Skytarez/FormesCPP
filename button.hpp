#ifndef BUTTON_HPP
#define BUTTON_HPP

#include <string>


class Button {
public:
    void drawButton();
    int getId();
    std::string getContent();

    inline int getX() {return x;}
    inline int getY() {return y;}
    inline int getWidth() {return width;}
    inline int getHeight() {return height;}

    Button(); // constructeur
    ~Button(); // destructeur

private:
    std::string content;
    int id;
    static int lastId = 0;
    int x, y, width, height;
}

#endif  // BUTTON_HPP
