SRC_PATH = ./src/
INC_DIR = ./includes/
OBJ_PATH = ./obj/

SRC_NAME = main.cpp \
			log.cpp
OBJ_NAME = $(SRC_NAME:.cpp=.o)
NAME = avm

OBJ = $(addprefix $(OBJ_PATH),$(OBJ_NAME))

CC = g++
CFLAGS = -Wall -Werror -Wextra

all:
	@echo "Making $(NAME) ..."
	@make $(NAME)

$(NAME): $(OBJ)
	$(CC) $(CFLAGS) $(LIBS) $^ -o $@

$(OBJ_PATH)%.o: $(SRC_PATH)%.cpp $(INC_DIR)
	@mkdir -p $(OBJ_PATH)
	$(CC) $(CFLAGS) -o $@ -c $< -I $(INC_DIR)

clean:
	@echo "\033[32;44m Make clean $(NAME) \033[0m"
	rm -rf $(OBJ) $(OBJ_PATH)

fclean: clean
	@echo "\033[32;44m Make fclean $(NAME) \033[0m"
	rm -f $(NAME)

re: fclean all

-include $(OBJ:.o=.d)

.PHONY: lib clean fclean re