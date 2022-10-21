using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace usuario.Migrations
{
    public partial class AtualizacaoUsuario3 : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.RenameColumn(
                name: "Nome",
                table: "tb_usuario",
                newName: "nome");

            migrationBuilder.RenameColumn(
                name: "Id",
                table: "tb_usuario",
                newName: "id");

            migrationBuilder.RenameColumn(
                name: "DataNascimento",
                table: "tb_usuario",
                newName: "data_nascimento");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.RenameColumn(
                name: "nome",
                table: "tb_usuario",
                newName: "Nome");

            migrationBuilder.RenameColumn(
                name: "id",
                table: "tb_usuario",
                newName: "Id");

            migrationBuilder.RenameColumn(
                name: "data_nascimento",
                table: "tb_usuario",
                newName: "DataNascimento");
        }
    }
}
