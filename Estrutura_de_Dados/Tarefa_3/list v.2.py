"""
Na segunda parte da tarefa, você deve modificar a implementação da classe MyList de forma a não permitir que um
elemento de mesmo valor seja adicionado novamente (a lista não deve permitir valores duplicados).
Caso se tente inserir um valor que já exista na lista, uma exceção deve ser retornada. Lembre-se,
esta implementação deve ser feita em uma nova versão da classe MyList (ou seja, em outro arquivo).
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

    @abstractmethod
    def check(self):
        """Checa se o elemento é repetido"""
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

    # Checa se o elemento é repetido
    def check(self):
        # Forma 1:
        if len(set(self._data)) != len(self._data):
            raise Exception('Esse valor já existe na lista!')
        # Forma 2:
        # for i in self._data:
        #   if i == elemento:
        #        raise Exception('Esse valor já existe na lista!')

    def insert(self, indice, elemento):
        self.exception(indice)
        self._data.insert(indice, elemento)
        self.check()

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
        self.check()

    def replace(self, indice, elemento):
        self.exception(indice)
        self._data[indice] = elemento
        self.check()

    def __str__(self):
        return self._data.__str__()

    def __len__(self):
        return len(self._data)


if __name__ == '__main__':
    lista = MyList()
    lista.insert(0, 1)
    lista.insert(1, 2)
    lista.insert(2, 3)
    # lista.append(1)
    lista.replace(1, 1)
    print(lista)
