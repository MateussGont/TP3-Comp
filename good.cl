class Animal {
    sound() : String {
        "Some generic animal sound"
    };
};

class Dog inherits Animal {
    sound() : String {
        "Woof!"
    };
};

class Cat inherits Animal {
    sound() : String {
        "Meow!"
    };
};

class Main {
    main() : Object {
        let my_dog : Dog <- new Dog(),
            my_cat : Cat <- new Cat(),
            my_animal : Animal <- new Animal() in {

            out_string(my_dog.sound() + "\n");  
            out_string(my_cat.sound() + "\n");  
            out_string(my_animal.sound() + "\n"); 
        }
    };
};
