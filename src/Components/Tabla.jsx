import { Table } from 'react-bootstrap';
import { useState, useEffect } from 'react';
import useFetch from '../Hooks/useFetch';

function Tabla() {

  const [usuarios, setUsuarios] = useState([])

  useEffect(() => async() => setUsuarios(await useFetch("/usuarios")))


  return (
    <Table striped bordered hover variant="dark" responsive>
      <thead>
        <tr>
          <th>#</th>
          <th>Nombre</th>
          <th>Apellido</th>
          <th>Es Supervisor</th>
        </tr>
      </thead>
      <tbody>
        {usuarios?.map((usuario, key) =>
        <tr key={key}>
          <td>{key + 1}</td>
          <td>{usuario.Nombre}</td>
          <td>{usuario.Apellido}</td>
          <td>{usuario?.EsSupervisor}- </td>
        </tr>)}
      </tbody>
    </Table>
  );
}

export default Tabla;