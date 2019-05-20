#include "button.hpp"

Button::Button(std::string _content, int _x, int _y, int _width, int _height)
: std::string content(_content), int x(_x), int y(_y), int width(_width), int height(_height);
{
    ++Button::LastId;
    id(Button::LastId);
}
