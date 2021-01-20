pragma solidity ^0.4.24;


contract UsersContract {

    // Estructura que representa al usuario
    struct User {
        string name;
        string surName;
    }

    // mapping que enlazara direcciones a usuarios
    mapping(address => User) private users;
    // Nuevo mapeo direcciones a boleano
    mapping(address => bool) private joinedUsers;
    // Arrays
    address[] total;


    event onUserJoined(address, string);

    //Esta funcion la van a ejecutar los usuarios para formar parte de 
    // nuestro mapping de usuarios
    function join(string name, string surName) public {
        require(!userJoined(msg.sender));
        User storage user = users[msg.sender];
        user.name = name;
        user.surName = surName;
        joinedUsers[msg.sender] = true;
        total.push(msg.sender);

        onUserJoined(msg.sender,string(abi.encodePacked(name, " ", surName)));


    }


    // Nos va a permitir recuperar el nombre de un usuario registrado a traves
    // de su direccion de ethereum
    function getUser(address addr) public view returns (string, string) {
        require(userJoined(msg.sender));
        User memory user = users[addr];
        return (user.name, user.surName);
    }

    function userJoined(address addr) private view returns (bool) {
        return joinedUsers[addr];
    }

    function totalUsers() public view returns (uint) {
        return total.length;
    }
}