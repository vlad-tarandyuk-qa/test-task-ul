
| Method | Google interpretation | URL | Status codes | Комментарии |
|--------|-----------------------|-----|--------------|-------------|
| `GET` | List | `/api/v2/orders` | `200 OK` | 1. При отсутствии записей возвращать пустой массив `T[]` 2. Возвращать только не удалённые (логически) записи |
| `GET` | Get | `/api/v2/orders/{id:uuid}` | `200 OK`, `404 Not Found`, `410 Gone` | `410 Gone` рекомендуется при наличии парных методов: `DELETE` (логическое удаление) и `PUT /.../undelete` (восстановление) |
| `POST` | Create | `/api/v2/orders/` или `/api/v2/orders/{id:uuid}` | `200 OK` или `201 Created`, `409 Conflict` | `201` используется при наличии парного `GET /{id}`. `409` — для случая `POST /.../{id:uuid}` |
| `PUT` | Update | `/api/v2/orders/{id:uuid}` | `200 OK` или `204 No Content` | `200` — если возвращается обновлённая read-model, иначе `204` |
| `PUT` | Create or Update | `/api/v2/orders/{id:uuid}` | `201 Created` / `200 OK` (создание), `204 No Content` / `200 OK` (обновление) | Используется для синхронизации Id между системами. Предпочтительны `201`/`204` для понимания выполненного сценария |
| `DELETE` | Delete | `/api/v2/orders/{id:uuid}` | `204 No Content`, `404 Not Found`, `410 Gone` | `410` — запись была логически удалена |
| `HEAD` | — | `/api/v2/orders/{id:uuid}` | `204 No Content` | |
