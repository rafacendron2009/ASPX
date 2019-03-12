Imports System.Data.SqlClient
Namespace AcessarDados
    Public Module Acessar_Dados

        'MultipleActiveResultSets=Permite abrir 1 DataReader dentro de outro já aberto.
        Public ConnString As String = ConfigurationManager.ConnectionStrings("rafaelConnectionString").ConnectionString

        Function GetConnection() As SqlConnection
            GetConnection = New SqlConnection(ConnString)
            GetConnection.Open()
        End Function

    End Module
End Namespace