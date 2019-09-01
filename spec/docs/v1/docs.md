

# Group Comments


## Comments [/comments]


### Get all comments [GET /api/v1/tasks/{task_id}/comments]

+ Parameters
    + task_id: `1` (number, required)

+ Request success
**GET**&nbsp;&nbsp;`/api/v1/tasks/1/comments`

    + Headers

            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "data": [
            
              ]
            }

### Create a comment [POST /api/v1/tasks/{task_id}/comments]

+ Parameters
    + task_id: `12` (integer, required)
    + body: `sequiconsequaturillumsolutaminima` (string, required)
    + image: `ActionDispatch%3A%3AHttp%3A%3AUploadedFile` (image, optional)

+ Request success
**POST**&nbsp;&nbsp;`/api/v1/tasks/4/comments`

    + Headers

            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
            Content-Type: application/x-www-form-urlencoded

    + Body

            comment[body]=repudiandaeconsecteturetvoluptasesttemporequaeeosaliquamvel

+ Response 201

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "data": {
                "id": "5",
                "type": "comment",
                "attributes": {
                  "body": "repudiandaeconsecteturetvoluptasesttemporequaeeosaliquamvel",
                  "image": {
                    "name": "image",
                    "record": {
                      "id": 5,
                      "body": "repudiandaeconsecteturetvoluptasesttemporequaeeosaliquamvel",
                      "task_id": 4,
                      "created_at": "2019-09-01T19:38:17.427Z",
                      "updated_at": "2019-09-01T19:38:17.427Z"
                    },
                    "dependent": "purge_later"
                  }
                },
                "relationships": {
                  "task": {
                    "data": {
                      "id": "4",
                      "type": "task"
                    }
                  }
                }
              }
            }

+ Request unprocessable
**POST**&nbsp;&nbsp;`/api/v1/tasks/7/comments`

    + Headers

            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
            Content-Type: application/x-www-form-urlencoded

    + Body

            comment[body]=123

+ Response 422

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "errors": {
                "body": [
                  "is too short (minimum is 10 characters)"
                ]
              }
            }

### Destroy the comment [DELETE /api/v1/comments/{id}]

+ Parameters
    + id: `12` (integer, required)

+ Request success
**DELETE**&nbsp;&nbsp;`/api/v1/comments/8`

    + Headers

            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
            Content-Type: application/x-www-form-urlencoded

+ Response 204

+ Request not_found
**DELETE**&nbsp;&nbsp;`/api/v1/comments/999`

    + Headers

            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
            Content-Type: application/x-www-form-urlencoded

+ Response 404

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "errors": "Couldn't find Comment with 'id'=999"
            }

# Group Projects


## Projects [/projects]


### Get all projects [GET /api/v1/projects]


+ Request success
**GET**&nbsp;&nbsp;`/api/v1/projects`

    + Headers

            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "data": [
                {
                  "id": "1",
                  "type": "project",
                  "attributes": {
                    "name": "in"
                  },
                  "relationships": {
                    "user": {
                      "data": {
                        "id": "2",
                        "type": "user"
                      }
                    },
                    "tasks": {
                      "data": [
            
                      ]
                    }
                  }
                }
              ]
            }

### Show project [GET /api/v1/projects/{id}]

+ Parameters
    + id: `2` (number, required)

+ Request success
**GET**&nbsp;&nbsp;`/api/v1/projects/2`

    + Headers

            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "data": {
                "id": "2",
                "type": "project",
                "attributes": {
                  "name": "dolore"
                },
                "relationships": {
                  "user": {
                    "data": {
                      "id": "4",
                      "type": "user"
                    }
                  },
                  "tasks": {
                    "data": [
            
                    ]
                  }
                }
              }
            }

+ Request not_found
**GET**&nbsp;&nbsp;`/api/v1/projects/999`

    + Headers

            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5

+ Response 404

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "errors": "Couldn't find Project with 'id'=999"
            }

### Create a project [POST /api/v1/projects]

+ Parameters
    + name: `delenitinobis` (string, required)

+ Request created
**POST**&nbsp;&nbsp;`/api/v1/projects`

    + Headers

            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
            Content-Type: application/x-www-form-urlencoded

    + Body

            project[name]=blanditiissunt

+ Response 201

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "data": {
                "id": "5",
                "type": "project",
                "attributes": {
                  "name": "blanditiissunt"
                },
                "relationships": {
                  "user": {
                    "data": {
                      "id": "8",
                      "type": "user"
                    }
                  },
                  "tasks": {
                    "data": [
            
                    ]
                  }
                }
              }
            }

+ Request unprocessable
**POST**&nbsp;&nbsp;`/api/v1/projects`

    + Headers

            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
            Content-Type: application/x-www-form-urlencoded

    + Body

            project[name]

+ Response 422

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "errors": {
                "name": [
                  "can't be blank"
                ]
              }
            }

### Update the project [PUT /api/v1/projects/{id}]

+ Parameters
    + id: `71` (integer, required)
    + name: `enimcommodi` (string, required)

+ Request success
**PUT**&nbsp;&nbsp;`/api/v1/projects/7`

    + Headers

            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
            Content-Type: application/x-www-form-urlencoded

    + Body

            project[name]=consequaturet

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "data": {
                "id": "7",
                "type": "project",
                "attributes": {
                  "name": "consequaturet"
                },
                "relationships": {
                  "user": {
                    "data": {
                      "id": "12",
                      "type": "user"
                    }
                  },
                  "tasks": {
                    "data": [
            
                    ]
                  }
                }
              }
            }

+ Request unprocessable
**PUT**&nbsp;&nbsp;`/api/v1/projects/8`

    + Headers

            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
            Content-Type: application/x-www-form-urlencoded

    + Body

            project[name]

+ Response 422

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "errors": {
                "name": [
                  "can't be blank"
                ]
              }
            }

### Destroy project [DELETE /api/v1/projects/{id}]

+ Parameters
    + id: `9` (number, required)

+ Request success
**DELETE**&nbsp;&nbsp;`/api/v1/projects/9`

    + Headers

            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
            Content-Type: application/x-www-form-urlencoded

+ Response 204

+ Request not_found
**DELETE**&nbsp;&nbsp;`/api/v1/projects/999`

    + Headers

            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
            Content-Type: application/x-www-form-urlencoded

+ Response 404

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "errors": "Couldn't find Project with 'id'=999"
            }

###  [DELETE /api/v1/projects/{id}]

+ Parameters
    + id: `12` (number, required)

+ Request forbidden
**DELETE**&nbsp;&nbsp;`/api/v1/projects/12`

    + Headers

            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
            Content-Type: application/x-www-form-urlencoded

+ Response 403

    + Headers

            Content-Type: text/html

# Group Registrations


## Registrations [/registrations]


### Create user [POST /api/v1/auth/registrations]

+ Parameters
    + username: `hooin_k%D1%91ma` (string, required)
    + password: `elpsykongru` (string, required)
    + password_confirmation: `elpsykongru` (string, required)

+ Request created
**POST**&nbsp;&nbsp;`/api/v1/auth/registrations`

    + Headers

            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
            Content-Type: application/x-www-form-urlencoded

    + Body

            user[username]=eaducimus&user[password]=VHZMJgUm7f&user[password_confirmation]=VHZMJgUm7f

+ Response 201

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "csrf": "mYa8P4YUa4ddKWdIvHQq0zVEqgbEwV6Y4WyiSfVAc55YVgaVKxphcvRkaDfVGq0BuE0ITQ0MdvVtd9bzhqc5mA=="
            }

+ Request unprocessable
**POST**&nbsp;&nbsp;`/api/v1/auth/registrations`

    + Headers

            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
            Content-Type: application/x-www-form-urlencoded

    + Body

            user[username]&user[password]

+ Response 422

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "errors": {
                "username": [
                  "can't be blank",
                  "is too short (minimum is 3 characters)"
                ],
                "password": [
                  "can't be blank",
                  "is too short (minimum is 8 characters)"
                ]
              }
            }

# Group Sessions


## Sessions [/sessions]


### Update session [PUT /api/v1/auth/sessions]


+ Request success
**PUT**&nbsp;&nbsp;`/api/v1/auth/sessions`

    + Headers

            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
            Content-Type: application/x-www-form-urlencoded

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "csrf": "PLZXVw8exy9ehTUqSVmpztL5/DiD1V70F/v2yYv2GW0p4JIZND30N4ymOn10phwR6vhvziLrUeIeyGmV2ZA/kQ=="
            }

+ Request unauthorized
**PUT**&nbsp;&nbsp;`/api/v1/auth/sessions`

    + Headers

            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
            Content-Type: application/x-www-form-urlencoded

+ Response 401

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "errors": "translation missing: en.jwt.unauthorized"
            }

### Create session [POST /api/v1/auth/sessions]

+ Parameters
    + username: `hooin_k%D1%91ma` (string, required)
    + password: `elpsykongru` (string, required)

+ Request success
**POST**&nbsp;&nbsp;`/api/v1/auth/sessions`

    + Headers

            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
            Content-Type: application/x-www-form-urlencoded

    + Body

            username=iustodolores&password=VHZMJgUm7f

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "csrf": "++ayLdxjVZnen9G5eZCXwZXAgyRDL6Iyg2IZdFX4dqcftt9eIwFVYSNMPpTra+jnAedloopPZ5bh+ZWW27EAIg=="
            }

+ Request not_found
**POST**&nbsp;&nbsp;`/api/v1/auth/sessions`

    + Headers

            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
            Content-Type: application/x-www-form-urlencoded

    + Body

            username=iodantnc&password=VHZMJgUm7f

+ Response 404

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "errors": "Couldn't find User"
            }

+ Request unauthorized
**POST**&nbsp;&nbsp;`/api/v1/auth/sessions`

    + Headers

            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
            Content-Type: application/x-www-form-urlencoded

    + Body

            username=voluptatibusillo&password=

+ Response 401

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "errors": "translation missing: en.jwt.unauthorized"
            }

### Destroy session [DELETE /api/v1/auth/sessions]


+ Request no_content
**DELETE**&nbsp;&nbsp;`/api/v1/auth/sessions`

    + Headers

            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
            Content-Type: application/x-www-form-urlencoded

+ Response 204

+ Request unathorized
**DELETE**&nbsp;&nbsp;`/api/v1/auth/sessions`

    + Headers

            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
            Content-Type: application/x-www-form-urlencoded

+ Response 401

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "errors": "translation missing: en.jwt.unauthorized"
            }

# Group Tasks


## Tasks [/tasks]


### Update state of a task [PATCH /api/v1/tasks/{task_id}/completions]

+ Parameters
    + task_id: `1` (number, required)

+ Request success
**PATCH**&nbsp;&nbsp;`/api/v1/tasks/1/completions`

    + Headers

            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
            Content-Type: application/x-www-form-urlencoded

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "data": {
                "id": "1",
                "type": "task",
                "attributes": {
                  "name": "et",
                  "deadline": null,
                  "position": 1,
                  "completed": true
                },
                "relationships": {
                  "project": {
                    "data": {
                      "id": "2",
                      "type": "project"
                    }
                  },
                  "comments": {
                    "data": [
            
                    ]
                  }
                }
              }
            }

+ Request when not_found
**PATCH**&nbsp;&nbsp;`/api/v1/tasks/888/completions`

    + Headers

            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
            Content-Type: application/x-www-form-urlencoded

+ Response 404

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "errors": "Couldn't find Task with 'id'=888"
            }

### Update postition of a task [PATCH /api/v1/tasks/{task_id}/prioritizations]

+ Parameters
    + task_id: `17` (integer, required)
    + position: `3` (integer, required)

+ Request success
**PATCH**&nbsp;&nbsp;`/api/v1/tasks/1/prioritizations`

    + Headers

            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
            Content-Type: application/x-www-form-urlencoded

    + Body

            task[position]=5

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "data": {
                "id": "1",
                "type": "task",
                "attributes": {
                  "name": "sed",
                  "deadline": null,
                  "position": 5,
                  "completed": false
                },
                "relationships": {
                  "project": {
                    "data": {
                      "id": "2",
                      "type": "project"
                    }
                  },
                  "comments": {
                    "data": [
            
                    ]
                  }
                }
              }
            }

+ Request when not_found
**PATCH**&nbsp;&nbsp;`/api/v1/tasks/888/prioritizations`

    + Headers

            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
            Content-Type: application/x-www-form-urlencoded

    + Body

            task[position]=5

+ Response 404

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "errors": "Couldn't find Task with 'id'=888"
            }

### Get all tasks [GET /api/v1/projects/{project_id}/tasks]

+ Parameters
    + project_id: `2` (number, required)

+ Request success
**GET**&nbsp;&nbsp;`/api/v1/projects/2/tasks`

    + Headers

            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "data": [
            
              ]
            }

### Show task [GET /api/v1/tasks/{id}]

+ Parameters
    + id: `2` (number, required)

+ Request success
**GET**&nbsp;&nbsp;`/api/v1/tasks/2`

    + Headers

            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "data": {
                "id": "2",
                "type": "task",
                "attributes": {
                  "name": "voluptatem",
                  "deadline": null,
                  "position": 1,
                  "completed": false
                },
                "relationships": {
                  "project": {
                    "data": {
                      "id": "4",
                      "type": "project"
                    }
                  },
                  "comments": {
                    "data": [
            
                    ]
                  }
                }
              }
            }

+ Request not_found
**GET**&nbsp;&nbsp;`/api/v1/tasks/888`

    + Headers

            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5

+ Response 404

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "errors": "Couldn't find Task with 'id'=888"
            }

### Create a task [POST /api/v1/projects/{project_id}/tasks]

+ Parameters
    + project_id: `17` (integer, required)
    + name: `temporaveniam` (string, required)

+ Request success
**POST**&nbsp;&nbsp;`/api/v1/projects/8/tasks`

    + Headers

            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
            Content-Type: application/x-www-form-urlencoded

    + Body

            task[name]=voluptatemexcepturi

+ Response 201

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "data": {
                "id": "5",
                "type": "task",
                "attributes": {
                  "name": "voluptatemexcepturi",
                  "deadline": null,
                  "position": 2,
                  "completed": false
                },
                "relationships": {
                  "project": {
                    "data": {
                      "id": "8",
                      "type": "project"
                    }
                  },
                  "comments": {
                    "data": [
            
                    ]
                  }
                }
              }
            }

+ Request unprocessable
**POST**&nbsp;&nbsp;`/api/v1/projects/10/tasks`

    + Headers

            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
            Content-Type: application/x-www-form-urlencoded

    + Body

            task[name]

+ Response 422

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "errors": {
                "name": [
                  "can't be blank"
                ]
              }
            }

### Update the task [PUT /api/v1/tasks/{id}]

+ Parameters
    + id: `17` (integer, required)
    + name: `ideveniet` (string, required)
    + deadline: `2019-09-08+19%3A38%3A16+UTC` (datetime, optional)

+ Request success
**PUT**&nbsp;&nbsp;`/api/v1/tasks/7`

    + Headers

            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
            Content-Type: application/x-www-form-urlencoded

    + Body

            task[name]=modiprovident

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "data": {
                "id": "7",
                "type": "task",
                "attributes": {
                  "name": "modiprovident",
                  "deadline": null,
                  "position": 1,
                  "completed": false
                },
                "relationships": {
                  "project": {
                    "data": {
                      "id": "12",
                      "type": "project"
                    }
                  },
                  "comments": {
                    "data": [
            
                    ]
                  }
                }
              }
            }

+ Request success
**PUT**&nbsp;&nbsp;`/api/v1/tasks/8`

    + Headers

            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
            Content-Type: application/x-www-form-urlencoded

    + Body

            task[deadline]=2019-09-08

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "data": {
                "id": "8",
                "type": "task",
                "attributes": {
                  "name": "voluptates",
                  "deadline": null,
                  "position": 1,
                  "completed": false
                },
                "relationships": {
                  "project": {
                    "data": {
                      "id": "14",
                      "type": "project"
                    }
                  },
                  "comments": {
                    "data": [
            
                    ]
                  }
                }
              }
            }

+ Request unprocessable
**PUT**&nbsp;&nbsp;`/api/v1/tasks/9`

    + Headers

            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
            Content-Type: application/x-www-form-urlencoded

    + Body

            task[name]

+ Response 422

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "errors": {
                "name": [
                  "can't be blank"
                ]
              }
            }

+ Request when not_found
**PUT**&nbsp;&nbsp;`/api/v1/tasks/888`

    + Headers

            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
            Content-Type: application/x-www-form-urlencoded

    + Body

            task[name]=autdolorem&task[deadline]=2019-09-08

+ Response 404

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "errors": "Couldn't find Task with 'id'=888"
            }

### Destroy task [DELETE /api/v1/tasks/{id}]

+ Parameters
    + id: `11` (number, required)

+ Request when success
**DELETE**&nbsp;&nbsp;`/api/v1/tasks/11`

    + Headers

            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
            Content-Type: application/x-www-form-urlencoded

+ Response 204

+ Request when not_found
**DELETE**&nbsp;&nbsp;`/api/v1/tasks/888`

    + Headers

            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
            Content-Type: application/x-www-form-urlencoded

+ Response 404

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "errors": "Couldn't find Task with 'id'=888"
            }
