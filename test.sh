
dbt run --models int_gs_booking_additional --profiles-dir ./ > out.txt
resultado=$?

out_put=$(cat out.txt)

echo "Algun mensaje relacionado al dbt run"

if [ $resultado -eq 0 ]; then
    echo "dbt run ejecutado con éxito."
    aws sns publish --topic-arn arn:aws:sns:us-east-1:992382490306:mi-tema  --message "$out_put" --subject "dbt run ejecutado con éxito" --profile AdministratorAccess-992382490306

else
    echo "dbt run falló."
    aws sns publish --topic-arn arn:aws:sns:us-east-1:992382490306:mi-tema  --message "$out_put" --subject "dbt run falló" --profile AdministratorAccess-992382490306

    exit 1
fi

