# 스파크 SQL



### 사용법

---

기존 자료 활용

- 자료 형식은 주로 json, parquet, orc
- RDD 생성 => 데이터프레임 변형(.toDF) => .sql api(select(조건), where(조건)) 쿼리 사용

기존 자료 활용 - RDD 생성 => 데이터셋 변형



### 구성

---

- **SparkSession** : DataFrame, DataSet을 생성하거나 사용자 정의함수(UDF)를 등록하기 위한 목적으로 사용

- **DataSet** : RDD 타입 기반 연산으로부터 SQL과 같은 비타입 연산까지 다양한 데이터 처리 연산을 제공

- **DataFrame** : 데이터베이스의 테이블 또는 R의 데이터프레임과 유사한 방법으로 데이터를 다룰 수 있는 다양한 메서드를 제공

- **DataFrameReader** : SparkSession의 read()를 통해 적븐할 수 있으며, “jdbc”, “json”, “parquet”등 다양한 유형의 데이터소스로부터 데이터프레임을 생성하는 메서드를 제공

- **DataFrameWriter** : Dataset의 write()를 통해 접근할 수 있으며, 데이터셋에 저장된 데이터를 파일 시스템, 데이터 베이스 등 다양한 저장소에 저장할 때 사용할 수 있는 메서드를 제공

- **Row, Column** : 데이터프레임을 구성하는 요소인 로우와 컬럼을 표현하는 모델이자 API, 데이터프레임에 포함된 데이터를 처리할 때 사용하는 대부분의 메서드를 제공

- **functions** : 컬럼과 더블어 데이터프레임을 이용해 데이터를 처리할 때 사용할 수 있는 각종 함수를 제공하는 오브젝트.  다양한 집계함수와 통계 함수를 제공

- **StructType**, **StructField** : 데이터에 대한 스키마 정보를 나타내는 API, StructType은 데이터프레임의 레코드에 대한 구조 정보를 나타내며, 내부에 여러 개의 StructField를 갖는 형태로 정의됩니다. StructType에 또 다른 StructType이 포함되는 중첩 구조의 표현이 가능합니다. 타입 추론이 어려운 경우 직접 StructType과 StructField를 이용해 타입을 지정해야 합니다.

- **GroupedData**, **GroupedDataSet** : groupBy()등에 의해 그루핑 연산을 수행할 때 사용되며, 집계와 관련된 다양한 연산을 제공합니다.



