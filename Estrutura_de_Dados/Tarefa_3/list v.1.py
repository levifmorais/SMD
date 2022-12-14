"""
Nesta tarefa, você deve adicionar ao ADT de lista os seguintes métodos:

length(self) que retorna o tamanho da lista;
remove_all(self, elemento) que remove todas as ocorrências de <elemento> na lista;
remove_at(self, index) que remove o elemento que se encontra na posição <index> da lista.
Caso a lista esteja vazia ou a posição não exista na lista, uma exceção deve ser retornada!

append(self, elemento) que concatena <elemento> na lista (adiciona na última posição);

replace(self, index, elemento) que substitui na posição <index> o valor existente com <elemento>.

Implemente todos os novos métodos adicionados ao ADT. Utilize a classe MyList para continuar a implementação.

Na segunda parte da tarefa, você deve modificar a implementação da classe MyList de forma a não permitir que um
elemento de mesmo valor seja adicionado novamente (a lista não deve permitir valores duplicados).
Caso se tente inserir um valor que já exista na lista, uma exceção deve ser retornada. Lembre-se,
esta implementação deve ser feita em uma nova versão da classe MyList (ou seja, em outro arquivo).

Você pode entregar, no SIGAA, um arquivo .zip com as duas implementações (dois arquivos .py distintos)

"""

from abc import ABC, abstractmethod


class ListADT(ABC):

    @abstractmethod
    def insert(self, indice, elemento):
        """Insere <elemento> na posição <indice>"""
        pass

    @abstractmethod
    def remove(self, elemento):
        """Remove primeira ocorrência de <elemento>"""
        pass

    @abstractmethod
    def count(self, elemento):
        """Conta a quantidade de <elemento> na lista"""
        pass

    @abstractmethod
    def clear(self):
        """Apaga a lista"""
        pass

    @abstractmethod
    def index(self, elemento):
        """Retorna o primeiro índice de <elemento>"""
        pass

    @abstractmethod
    def length(self):
        """Retorna o tamanho da lista"""
        pass

    @abstractmethod
    def remove_all(self, elemento):
        """Remove todas as ocorrências de <elemento> na lista"""
        pass

    @abstractmethod
    def remove_at(self, indice):
        """Remove o elemento que se encontra na posição <indice> da lista"""
        pass

    @abstractmethod
    def append(self, elemento):
        """Concatena o <elemento> na lista (adiciona na última posição)"""
        pass

    @abstractmethod
    def replace(self, indice, elemento):
        """Substitui na posição <indice> o valor existente com <elemento>"""
        pass

    @abstractmethod
    def exception(self, indice):
        """Retorna uma exceção caso a lista esteja vazia ou a posição <indice> não exista na lista"""
        pass

    @abstractmethod
    def exception_empty(self):
        """Retorna uma exceção caso a lista esteja vazia"""
        pass


class MyList(ListADT):

    def __init__(self):
        self._data = list()  # repositório/local onde as informações serão armazenadas

    # Caso a lista esteja vazia ou a posição não exista na lista, uma exceção deve ser retornada!
    def exception(self, indice):
        if not self._data:
            raise Exception('A lista está vazia!')
        elif indice >= (len(self._data)):
            raise Exception('Essa posição não existe na lista!')

    # Caso a lista esteja vazia, uma exceção deve ser retornada !
    def exception_empty(self):
        if not self._data:
            raise Exception('A lista está vazia!')

    def insert(self, indice, elemento):
        self.exception(indice)
        self._data.insert(indice, elemento)

    def remove(self, elemento):
        self.exception_empty()
        self._data.remove(elemento)

    def count(self, elemento):
        self.exception_empty()
        return self._data.count(elemento)

    def clear(self):
        self.exception_empty()
        self._data = list()

    def index(self, elemento):
        self.exception_empty()
        return self._data.index(elemento)

    def length(self):
        self.exception_empty()
        return self.__len__()

    def remove_all(self, elemento):
        self.exception_empty()
        removed = []
        for i in self._data:
            if i != elemento:
                removed.append(i)
        self._data.clear()
        self._data = removed

    def remove_at(self, indice):
        self.exception(indice)
        self._data.pop(indice)

    def append(self, elemento):
        self._data.append(elemento)

    def replace(self, indice, elemento):
        self.exception(indice)
        self._data[indice] = elemento

    def __str__(self):
        return self._data.__str__()

    def __len__(self):
        return len(self._data)


if __name__ == '__main__':
    lista = MyList()
    # lista.remove_at(2)
    # lista.insert(0, 1)

    # lista.append(0)
    # lista.append(1)
    lista.append(2)
    lista.clear()
    # lista.insert(3, 5)
    # lista.insert(1, 1)
    # lista.insert(2, 2)
    # lista.replace(0, 1500)
    # lista.replace(5, 200)
    print(lista)
